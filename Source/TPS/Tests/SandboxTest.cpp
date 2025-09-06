// GPL Public Licnese

#if (WITH_DEV_AUTOMATION_TESTS || WITH_PERF_AUTOMATION_TESTS)

#include "Tests/SandboxTest.h"
#include "CoreMinimal.h"
#include "Misc/AutomationTest.h"

IMPLEMENT_SIMPLE_AUTOMATION_TEST(FMathMaxInt, "TPSGame.Math.MaxInt",
    EAutomationTestFlags::EditorContext | EAutomationTestFlags::CommandletContext | EAutomationTestFlags::LowPriority |
        EAutomationTestFlags::ProductFilter);

bool FMathMaxInt::RunTest(const FString& Parameters)
{
    AddInfo("Max [int] func testing");

    TestTrue("2 different positive numbers", FMath::Max(7, 14) == 14);
    TestEqual("2 same positive numbers", FMath::Max(25, 25), 25);
    TestTrueExpr(FMath::Max(0, 0) == 0);
    TestEqual("negative number and zero", FMath::Max(-2345, 0), 0);
    TestEqual("two negative numbers", FMath::Max(-45, -67), -45);
    TestEqual("two equal negative numbers", FMath::Max(-9, -9), -9);
    TestEqual("positive and negative numbers", FMath::Max(10, -3), 10);

    return true;
}

IMPLEMENT_SIMPLE_AUTOMATION_TEST(FMathSqrt, "TPSGame.Math.Sqrt",
    EAutomationTestFlags::EditorContext | EAutomationTestFlags::CommandletContext | EAutomationTestFlags::MediumPriority |
        EAutomationTestFlags::ProductFilter);

bool FMathSqrt::RunTest(const FString& Parameters)
{
    AddInfo("Math sqrt [float] testing");

    TestEqual("Sqrt of an even number", FMath::Sqrt(4.f), 2.f);
    TestEqual("Sqrt of an odd number with tolerance", FMath::Sqrt(3.f), 1.7f, .1f);

    return true;
}

IMPLEMENT_SIMPLE_AUTOMATION_TEST(FMathMin, "TPSGame.Math.Min",
    EAutomationTestFlags::EditorContext | EAutomationTestFlags::CommandletContext | EAutomationTestFlags::MediumPriority |
        EAutomationTestFlags::ProductFilter);

bool FMathMin::RunTest(const FString& Parameters)
{
    AddInfo("Math min manual testing");

    if (FMath::Min(2, 10) != 2)
    {
        AddWarning("FMath::Min returned wrong number");
        return true;
    }

    return true;
}

#endif