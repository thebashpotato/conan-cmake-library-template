#pragma once

#include <spdlog/fmt/fmt.h>
#include <spdlog/logger.h>

#include <memory>
#include <utility>

namespace myproject
{

class Logging
{
  public:
    static void Init() noexcept;

    static auto core_logger() noexcept -> std::shared_ptr<spdlog::logger> &
    {
        return s_core_logger;
    }

  private:
    static std::shared_ptr<spdlog::logger> s_core_logger;
};

namespace log
{
template <typename... Args> void debug(fmt::format_string<Args...> fmt, Args &&...args)
{
    if (Logging::core_logger())
    {
        Logging::core_logger()->debug(fmt, std::forward<Args>(args)...);
    }
}

template <typename... Args> void info(fmt::format_string<Args...> fmt, Args &&...args)
{
    if (Logging::core_logger())
    {
        Logging::core_logger()->info(fmt, std::forward<Args>(args)...);
    }
}

template <typename... Args> void warn(fmt::format_string<Args...> fmt, Args &&...args)
{
    if (Logging::core_logger())
    {
        Logging::core_logger()->warn(fmt, std::forward<Args>(args)...);
    }
}

template <typename... Args> void error(fmt::format_string<Args...> fmt, Args &&...args)
{
    if (Logging::core_logger())
    {
        Logging::core_logger()->error(fmt, std::forward<Args>(args)...);
    }
}
} // namespace log
} // namespace myproject
