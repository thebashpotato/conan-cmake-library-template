#include <gtest/gtest.h>

#include <myproject/config.hpp>
#include <myproject/interface.hpp>

using namespace myproject;

TEST(FactorialTestSuite, Test1)
{
    ASSERT_EQ(factorial(0), 1);
    ASSERT_EQ(factorial(1), 1);
    ASSERT_EQ(factorial(2), 2);
    ASSERT_EQ(factorial(3), 6);
    ASSERT_EQ(factorial(10), 3628800);
}

TEST(ConfigFileTestSuite, Test1)
{
    ASSERT_EQ(myproject_name, "myproject");
    ASSERT_EQ(myproject_version_major, 0);
    ASSERT_EQ(myproject_version_minor, 1);
    ASSERT_EQ(myproject_version_patch, 0);
}
