using Microsoft.AspNetCore.Mvc;

namespace Healthcheck.API.Controllers
{
    [Route("")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        [HttpGet]
        [Route("")]
        public IActionResult Index()
        {
            return Ok("Online...");
        } 
    }
}