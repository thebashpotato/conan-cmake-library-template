#include <myproject/interface.hpp>

namespace myproject
{

auto factorial(int n) noexcept -> int
{
    int result = 1;

    while (n > 0)
    {
        result *= n;
        --n;
    }

    return result;
}

} // namespace myproject
