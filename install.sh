#!/bin/bash

# --- The Persona Installer ---

# Define the target directory
TARGET_DIR="$HOME/.gemini/extensions"
SOURCE_DIR=$(pwd) # Assumes the script is run from the repo root

PERSONA_ARG=$1

# If a persona is passed as an argument, use it. Otherwise, ask the user.
if [ -z "$PERSONA_ARG" ]; then
  # 1. Ask the user which persona they want to install
  echo "🤖 Welcome to the Gemini Persona Onboarding!"
  echo "Which persona would you like to install?"
  echo "  1) Product Owner (po)"
  echo "  2) Solution Architect (sa)"
  echo "  3) Developer (dev)"
  echo "  4) IT Engineer (devops)"
  echo "  5) Database Engineer (db)"
  echo "  6) QA Engineer (qa)"
  echo "  7) Site Reliability Engineer (sre)"
  echo "  8) Demo (demo)"
  read -p "Enter the number (1-8) or abbreviation: " choice
else
  choice=$PERSONA_ARG
fi

# 2. Set the persona folder based on the choice
case $choice in
  1|po)
    PERSONA_FOLDER="po"
    ;;
  2|sa)
    PERSONA_FOLDER="sa"
    ;;
  3|dev)
    PERSONA_FOLDER="dev"
    ;;
  4|it)
    PERSONA_FOLDER="devops"
    ;;
  5|db)
    PERSONA_FOLDER="db"
    ;;
  6|qa)
    PERSONA_FOLDER="qa"
    ;;
  7|sre)
    PERSONA_FOLDER="sre"
    ;;
  8|demo)
    PERSONA_FOLDER="demo"
    ;;
  *)
    echo "❌ Invalid choice: '$choice'. Please use a number or abbreviation (e.g., '1' or 'po')."
    exit 1
    ;;
esac

# 3. Ensure the target directory exists
echo "Checking for $TARGET_DIR..."
mkdir -p "$TARGET_DIR"
if [ $? -ne 0 ]; then
  echo "❌ Error: Could not create directory $TARGET_DIR. Please check permissions."
  exit 1
fi

# Add a warning and ask for confirmation before removing previous configurations
if [ -z "$PERSONA_ARG" ]; then
    echo "⚠️ Warning: Installing a new persona will remove any previously installed persona configurations."
    read -p "Are you sure you want to continue? (y/n): " confirm
else
    # Auto-confirm if persona was passed as an argument
    confirm="y"
fi

case $confirm in
  [yY]|[yY][eE][sS])
    # Proceed with deletion
    # Define all possible persona folders
    ALL_PERSONA_FOLDERS=("po" "sa" "dev" "devops" "db" "qa" "sre" "demo")

    # Remove previously installed personas
    echo "Removing previously installed personas from $TARGET_DIR..."
    for folder in "${ALL_PERSONA_FOLDERS[@]}"; do
      if [ -d "$TARGET_DIR/$folder" ]; then
        echo "  - Removing $TARGET_DIR/$folder"
        rm -rf "$TARGET_DIR/$folder"
      fi
    done
    ;;
  *)
    echo "❌ Installation cancelled. Exiting."
    exit 1
    ;;
esac

# 4. Copy the persona files
echo "Installing files for '$PERSONA_FOLDER' persona..."
cp -R "$SOURCE_DIR/$PERSONA_FOLDER/" "$TARGET_DIR/$PERSONA_FOLDER/"

# 5. Success!
echo "✅ Success! The $PERSONA_FOLDER persona is installed."
echo "Restart your terminal or run 'gemini' to use your new commands and context."
