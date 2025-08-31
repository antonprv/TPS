// Copyright 1998-2019 Epic Games, Inc. All Rights Reserved.

#include "TPSGameMode.h"
#include "TPSCharacter.h"
#include "UObject/ConstructorHelpers.h"
#include "GameFramework/GameUserSettings.h"

ATPSGameMode::ATPSGameMode()
{
    // set default pawn class to our Blueprinted character
    // Find the Blueprint class of our player pawn
    static ConstructorHelpers::FClassFinder<APawn> PlayerPawnBPClass(
        TEXT("/Game/ThirdPersonCPP/Blueprints/Controller/BP_PlayerCharacter"));

    if (PlayerPawnBPClass.Succeeded())
    {
        DefaultPawnClass = PlayerPawnBPClass.Class;
    }
    else
    {
        // Fallback to C++ class if Blueprint is missing (important for server-only builds)
        DefaultPawnClass = APawn::StaticClass();
        UE_LOG(LogTemp, Warning, TEXT("BP_PlayerCharacter not found! Defaulting to APawn."));
    }
}

void ATPSGameMode::BeginPlay()
{
    Super::BeginPlay();
    SetLowScalability();
    SetMaxFPS(240);
    SetScreenPercentage(60);
}

void ATPSGameMode::SetLowScalability()
{
    if (GEngine)
    {
        if (UGameUserSettings* Settings = GEngine->GetGameUserSettings())
        {
            // Set all scalability settings to low (0)
            Settings->ScalabilityQuality.AntiAliasingQuality = 0;
            Settings->ScalabilityQuality.EffectsQuality = 0;
            Settings->ScalabilityQuality.PostProcessQuality = 1;
            Settings->ScalabilityQuality.ShadowQuality = 2;
            Settings->ScalabilityQuality.TextureQuality = 0;
            Settings->ScalabilityQuality.ViewDistanceQuality = 1;

            // Apply and save the settings
            Settings->ApplyNonResolutionSettings();
            Settings->SaveSettings();
        }
    }
}

void ATPSGameMode::SetMaxFPS(const int32 MaxFPS)
{
    if (GEngine)
    {
        GEngine->SetMaxFPS(MaxFPS);
    }
}

void ATPSGameMode::SetScreenPercentage(const int32 ScreenPercentage)
{
    if (GEngine && GEngine->GameViewport)
    {
        // Set the screen percentage (resolution fraction) via console variable
        FString Command = FString::Printf(TEXT("r.ScreenPercentage %d"), ScreenPercentage);
        GEngine->GameViewport->Exec(nullptr, *Command, *GLog);
    }
}