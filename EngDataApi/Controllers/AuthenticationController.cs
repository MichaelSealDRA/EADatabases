﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace TodoApi.Controllers;

[Route("[controller]")]
[ApiController]
public class AuthenticationController : ControllerBase
{
    private readonly IConfiguration _config;
    public AuthenticationController(IConfiguration config)
    {
        _config = config;
    }
    public record AuthenticationData(string? UserName, string? Password);
    public record UserData(int Id, string FirstName, string LastName, string UserName, string Access);

    [HttpPost("token")]
    [AllowAnonymous]
    public ActionResult<string> Authenticate([FromBody] AuthenticationData data)
    {
        var user = ValidateCredentials(data);

        if (user is null)
        {
            return Unauthorized();
        }

        string token = GenerateToken(user);

        return Ok(token);
    }
    private string GenerateToken(UserData user)
    {
        var secretKey = new SymmetricSecurityKey(
            Encoding.ASCII.GetBytes(
                _config.GetValue<string>("Authentication:SecretKey")));

        var signingCredentials = new SigningCredentials(secretKey, SecurityAlgorithms.HmacSha256);

        List<Claim> claims = new();
        claims.Add(new(JwtRegisteredClaimNames.Sub, user.Id.ToString()));
        claims.Add(new(JwtRegisteredClaimNames.UniqueName, user.UserName));
        claims.Add(new(JwtRegisteredClaimNames.GivenName, user.FirstName));
        claims.Add(new(JwtRegisteredClaimNames.FamilyName, user.LastName));
        claims.Add(new Claim("Access", user.Access));

        var token = new JwtSecurityToken(
            _config.GetValue<string>("Authentication:Issuer"),
            _config.GetValue<string>("Authentication:Audience"),
            claims,
            DateTime.UtcNow,
            DateTime.UtcNow.AddMinutes(10), // UPDATE FOR PRODUCTION - DECIDE ON TIME
            signingCredentials);

        return new JwtSecurityTokenHandler().WriteToken(token);
    }
    private UserData? ValidateCredentials(AuthenticationData data)
    {
        // THIS IS NOT PRODUCTION CODE - REPLACE THIS WITH A CALL TO YOUR AUTH SYSTEM
        if (CompareValues(data.UserName, "mseal") &&
            CompareValues(data.Password, "12345"))
        {
            return new UserData(1, "Michael", "Seal", data.UserName!, "EA");
        }
        else if (CompareValues(data.UserName, "nburger") &&
                CompareValues(data.Password, "12345"))
        {
            return new UserData(2, "Nealon", "Burger", data.UserName!, "EA,DRA");
        }

        return null;
    }
    private bool CompareValues(string? actual, string expected)
    {
        if (actual is not null)
        {
            if (actual.Equals(expected))
            {
                return true;
            }
        }

        return false;
    }
}
