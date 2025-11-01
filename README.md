# Gemini Persona Kit - DevOps Demo Scenario

This repository contains a demonstration of how "Persona Packs" can be used to tailor the Gemini CLI for different roles within a DevOps team. Each persona (Product Owner, Developer, QA, etc.) has a specific set of custom commands and context defined in their respective directories.

## Demo Flow: A Simple DevOps Lifecycle

This demo illustrates a simplified workflow, starting with the Product Owner (PO) and their role in defining a new product.

### 1. The Product Owner (PO) Persona

The PO is responsible for defining the product vision and requirements. Their `GEMINI.md` file configures the Gemini CLI to act as an expert Product Owner, focusing on "what" and "why" rather than "how".

**Location of Persona Files:** `/po`

### 2. Demo Scenario: Creating a New Web Application

In this scenario, the user will act as a Product Owner to kickstart the development of a simple web application.

#### Step 1: Generate a Product Requirements Document (PRD)

The PO has a new idea for a "Recipe Book" web application. They can use a custom command to quickly generate a structured PRD.

**Custom Command:** `create-prd` (defined in `po/commands/create-prd.toml`)

*   **Action:** The user will be prompted for a high-level description of the product.
*   **Example Input:** "A web application that allows users to store, search, and share their favorite recipes."
*   **Output:** Gemini, acting as a PO assistant, will generate a complete PRD in Markdown format. This PRD will include:
    *   Introduction and Goals
    *   Target User Personas
    *   A set of well-defined User Stories in the format: "As a [user], I want [action], so that [benefit]."

#### Step 2: Export User Stories to Jira

Once the PRD is ready and the user stories are defined, the PO needs to import them into the team's project management tool, Jira.

**Custom Command:** `export-stories-to-jira` (defined in `po/commands/export-stories-to-jira.toml`)

*   **Action:** The user will be prompted for the path to the generated PRD file.
*   **Output:** The tool will parse the user stories from the PRD and generate a `jira-import.csv` file. This CSV will be structured with columns like `Summary`, `Description`, and `Issue Type` (defaulting to 'Story'), ready for a seamless import into a Jira project.

### 3. Next Steps in the Lifecycle

Once the stories are in Jira, the demo can continue with other personas:

*   **Solution Architect (`/sa`):** Can be asked to design the architecture for the "Recipe Book" application based on the user stories.
*   **Developer (`/dev`):** Can pick up a story from Jira and use the `implement` command to start writing code.
*   **QA Engineer (`/qa`):** Can be tasked with creating a test plan for a specific user story.
*   **IT Engineer (`/it`):** Can be asked to set up the CI/CD pipeline for the new application.

This initial PO-driven flow sets the stage for the entire DevOps lifecycle, demonstrating how persona-specific commands can streamline the workflow for each team member.
