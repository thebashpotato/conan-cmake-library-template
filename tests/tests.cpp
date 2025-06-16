#include <gtest/gtest.h>

#include <myproject/config.hpp>

using namespace myproject;

TEST(ConfigFileTestSuite, Test1)
{
    ASSERT_EQ(myproject_name, "myproject");
    ASSERT_EQ(myproject_version_major, 0);
    ASSERT_EQ(myproject_version_minor, 1);
    ASSERT_EQ(myproject_version_patch, 0);
}
