# Gemini Persona Kit - DevOps Demo Scenario

This repository contains a demonstration of how "Persona Packs" can be used to tailor the Gemini CLI for different roles within a DevOps team. Each persona (Product Owner, Developer, QA, etc.) has a specific set of custom commands and context defined in their respective directories.

## Demo Flow: A Simple DevOps Lifecycle

This demo illustrates a simplified workflow, starting with the Product Owner (PO) and their role in defining a new product.

### 1. The Product Owner (PO) Persona

The PO is responsible for defining the product vision and requirements. Their `GEMINI.md` file configures the Gemini CLI to act as an expert Product Owner, focusing on "what" and "why" rather than "how".

**Location of Persona Files:** `/po`

### 2. Demo Scenario: End-to-End Workflow

This scenario demonstrates a complete workflow involving multiple personas:

#### Step 1: Product Owner (PO) Creates PRD

The PO initiates the process by creating a Product Requirements Document (PRD). The initial requirement should be high-level, allowing the Gemini CLI (acting as the PO persona) to challenge for more details.

*   **Action:** The PO calls the `/create-prd` command.
*   **Example Input:** "A new feature for user authentication."
*   **Output:** Gemini, as the PO persona, will generate a PRD. The PO then requests Gemini to write this PRD to `specifications/prd.md`.

#### Step 2: Product Owner (PO) Exports Stories to Jira

Once the PRD is finalized, the PO exports one or two user stories to Jira.

*   **Action:** The PO calls the `/export-stories-to-jira` command.
*   **Output:** The selected user stories are created as issues in Jira.

#### Step 3: Solution Architect (SA) Designs Architecture

The Solution Architect then takes over, designing the architecture based on the PRD. The SA might also use the `/research` command to gather more information or challenge design choices.

*   **Action:** The SA calls the `/design-from-local-prd` command, referencing `specifications/prd.md`. The SA might also call `/research` to challenge the Gemini CLI for more details about architectural choices.
*   **Output:** Gemini, as the SA persona, generates an architecture document. The SA then asks Gemini to write this document to `specifications/architecture.md`.

#### Step 4: Developer Implements and Commits

The Developer begins by listing the stories in Jira, then implements a specific story, referencing the PRD and architecture documents. Finally, the developer stages and commits the changes.

*   **Action:** The Developer queries Jira using `/jira:list-stories` to get the story number (e.g., SCRUM-11). Then, the developer asks to implement the story using a command like: `/implement SCRUM-11 by referring to @specifications/prd.md and @specifications/architecture.md`. Finally, the developer asks: "can you stage and commit those changes?"
*   **Output:** Gemini, as the Developer persona, implements the story and commits the changes.

#### Step 5: IT Engineer (Ops-Bot) Checks Logs

After deployment, the IT Engineer (Ops-Bot) checks the latest logs for errors.

*   **Action:** The IT Engineer asks: "can you check the latest logs of the [project-name] project? I am interested about the errors that occurred in the last week?"
*   **Output:** Gemini, as the IT Engineer persona, retrieves and displays the relevant log entries.

### 3. Next Steps in the Lifecycle

Once the stories are in Jira, the demo can continue with other personas:

*   **Solution Architect (`/sa`):** Can be asked to design the architecture for the "Recipe Book" application based on the user stories.
*   **Developer (`/dev`):** Can pick up a story from Jira and use the `implement` command to start writing code.
*   **QA Engineer (`/qa`):** Can be tasked with creating a test plan for a specific user story.
*   **IT Engineer (`/it`):** Can be asked to set up the CI/CD pipeline for the new application.

This initial PO-driven flow sets the stage for the entire DevOps lifecycle, demonstrating how persona-specific commands can streamline the workflow for each team member.
