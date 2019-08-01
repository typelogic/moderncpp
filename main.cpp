#include <iostream>

#include <gtest/gtest.h>
#include <gmock/gmock.h>

int main(int argc, char *argv[])
{
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

TEST(My, Test1)
{
    auto func = [](int a, int b) -> int {
        return a + b;
    };

    ASSERT_EQ(7, func(3,4));
}
