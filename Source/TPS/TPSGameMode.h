// Copyright 1998-2019 Epic Games, Inc. All Rights Reserved.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/GameModeBase.h"
#include "TPSGameMode.generated.h"

UCLASS(MinimalAPI)
class ATPSGameMode : public AGameModeBase
{
    GENERATED_BODY()

public:
    ATPSGameMode();

protected:
    virtual void BeginPlay() override;

private:
    static void SetLowScalability();
    static void SetMaxFPS(int32 MaxFPS);
    static void SetScreenPercentage(int32 ScreenPercentage);
};
