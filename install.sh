#!/bin/bash

# --- The Persona Installer ---

# Define the target directory
TARGET_DIR="$HOME/.gemini/extensions"
SOURCE_DIR=$(pwd) # Assumes the script is run from the repo root

# 1. Ask the user which persona they want to install
echo "🤖 Welcome to the Gemini Persona Onboarding!"
echo "Which persona would you like to install?"
echo "  1) Product Owner (po)"
echo "  2) Database Engineer (db)"
echo "  3) Developer (dev)"
echo "  4) IT Engineer (it)"
echo "  5) Solution Architect (sa)"
echo "  6) QA Engineer (qa)"
read -p "Enter the number (1-6): " choice

# 2. Set the persona folder based on the choice
case $choice in
  1)
    PERSONA_FOLDER="po"
    ;;
  2)
    PERSONA_FOLDER="db"
    ;;
  3)
    PERSONA_FOLDER="dev"
    ;;
  4)
    PERSONA_FOLDER="it"
    ;;
  5)
    PERSONA_FOLDER="sa"
    ;;
  6)
    PERSONA_FOLDER="qa"
    ;;
  *)
    echo "❌ Invalid choice. Exiting."
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

# 4. Copy the persona files
echo "Installing files for '$PERSONA_FOLDER' persona..."
cp -R "$SOURCE_DIR/$PERSONA_FOLDER/" "$TARGET_DIR/$PERSONA_FOLDER/"

# 5. Success!
echo "✅ Success! The $PERSONA_FOLDER persona is installed."
echo "Restart your terminal or run 'gemini' to use your new commands and context."