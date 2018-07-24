using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ArtCrestApplication.Startup))]
namespace ArtCrestApplication
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
