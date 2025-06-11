#include <myproject/config.hpp>
#include <myproject/log.hpp>

#include <spdlog/common.h>
#include <spdlog/logger.h>
#include <spdlog/sinks/stdout_color_sinks.h>
#include <spdlog/spdlog.h>

#include <memory>

namespace myproject
{

std::shared_ptr<spdlog::logger> Logging::s_core_logger{};

void Logging::Init() noexcept
{
    spdlog::set_pattern("%^[%T]::[%n]: %v%$");
    s_core_logger = spdlog::stdout_color_mt(std::string(myproject_name));
    s_core_logger->set_level(spdlog::level::trace);
}

} // namespace myproject
