#include <myproject/config.hpp>
#include <myproject/log.hpp>

using namespace myproject;

auto main() -> int
{
    Logging::Init();
    log::info("Package test sucessful for {} v{}", myproject_name, myproject_version);

    return 0;
}
