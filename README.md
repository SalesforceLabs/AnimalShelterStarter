# Animal Shelter Starter

Animal Shelter Starter provides the foundation to use Salesforce for managing animals, treatments, conditions, housing and related activities.

The team within Salesforce.org have configured Animal, Treatment, Condition, Adoption and Exercise objects, along with Flows and Automation which you can install and adapt to your requirements, in addition, these are already linked to standard objects within Salesforce, such as Contacts and Accounts.

Animal Shelter Starter is built to scale with your organisation, providing you with a foundation to begin managing your animals from rescue to recovery and beyond. Utilising the Salesforce platform, you will be able to take full control of your operations with the power of the world’s leading CRM.

# Deployment

## Installing in Sandbox or Production

### Option 1: AppExchange Installation (Recommended)

1. Visit the [Animal Shelter Starter listing on the AppExchange](https://appexchange.salesforce.com/appxListingDetail?listingId=a0N3A00000G0zBTUAZ)
2. Click "Get It Now" and select your target org
3. Choose installation options:
   - **Install for Admins Only** (recommended for initial setup)
   - **Install for All Users** (after configuration is complete)
4. Review and accept permissions
5. Complete the installation

### Option 2: Manual Deployment via Salesforce CLI

**Prerequisites:**

- Salesforce CLI installed
- Access to target sandbox/production org

**Steps:**

1. Clone this repository:

   ```bash
   git clone https://github.com/SalesforceLabs/AnimalShelterStarter.git
   cd AnimalShelterStarter
   ```

2. Authorize your target org:

   ```bash
   sf org login web --alias production
   # or for sandbox:
   sf org login web --alias sandbox
   ```

3. Deploy the metadata:

   ```bash
   sf project deploy start --target-org production
   # or for sandbox:
   sf project deploy start --target-org sandbox
   ```

4. Assign the Animal Shelter Starter permission set to users:
   ```bash
   sf org assign permset --name "Animal_Shelter_Starter" --target-org production
   ```

## Post-Installation Configuration

1. **Setup Custom Settings**: Configure any custom settings required for your organization
2. **Data Import**: Use Data Import Wizard or Data Loader to import existing animal data
3. **User Training**: Ensure users are trained on the new objects and processes
4. **Testing**: Thoroughly test all functionality in a sandbox before production deployment

# Development

Please note that you must have access to the managed package namespace before you can work on this package. Please reach out to the team if you are internal to Salesforce and want to work on this package.

## Prerequisites

### Dependencies

- VSCode > https://code.visualstudio.com/download
- Salesforce Extension Pack > https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode
- Salesforce CLI > https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli.meta/sfdx_cli/sfdx_cli_install.htm
- Git > https://git-scm.com/downloads
- GitHub Desktop (Optional) > https://docs.github.com/en/desktop/installing-and-authenticating-to-github-desktop/installing-github-desktop

### DevHub Access

Request access to the DevHub from Stewart Anderson. The DevHub is required for creating namespaced scratch orgs for managed package development.

1. Open the command palette in VSCode (`Cmd + Shift + P` on Mac, `Ctrl + Shift + P` on Windows)
2. Select "SFDX: Authorize a DevHub"
3. Login with your provided credentials
4. Verify connection with: `sf org list --all`

## Development Workflow

### Initial Setup

1. **Fork and Clone**: Fork the repository and clone your fork locally

   ```bash
   git clone https://github.com/YOUR-USERNAME/AnimalShelterStarter.git
   cd AnimalShelterStarter
   ```

2. **Create Feature Branch**: Always create a new branch from master
   ```bash
   git checkout master
   git pull origin master
   git checkout -b feature/your-feature-name
   ```

### Working with Namespaced Scratch Orgs

Since this is a managed package, you must use **namespaced scratch orgs** for development:

1. **Create Namespaced Scratch Org**:

   ```bash
   sf org create scratch --definition-file config/project-scratch-def.json --alias dev-org --duration-days 30 --set-default
   ```

2. **Deploy Source**:

   ```bash
   sf project deploy start --source-dir force-app
   ```

3. **Open Scratch Org**:
   ```bash
   sf org open --target-org dev-org
   ```

### Development Process

1. **Make Changes**: Develop your feature/fix in the scratch org

   - Add new objects, fields, flows, etc.
   - Update the **Animal Shelter Starter** permission set with any new permissions
   - Test functionality thoroughly

2. **Retrieve Changes**:

   ```bash
   sf project retrieve start --source-dir force-app
   ```

3. **Version Control**:

   ```bash
   git add .
   git commit -m "Description of your changes"
   git push origin feature/your-feature-name
   ```

4. **Create Pull Request**:
   - Go to GitHub and create a PR from your feature branch to `master`
   - Include detailed description of changes
   - Add screenshots/videos if UI changes are involved

### Important Development Notes

- **Namespace Awareness**: All custom objects, fields, and components will be automatically namespaced
- **Permission Sets**: Always update the Animal Shelter Starter permission set when adding new metadata
- **Testing**: Include appropriate test coverage for any Apex code
- **Documentation**: Update relevant documentation for new features

### Troubleshooting

- **Namespace Issues**: Ensure you're using a namespaced scratch org from the correct DevHub
- **Permission Errors**: Verify the Animal Shelter Starter permission set includes all necessary permissions
- **Deployment Failures**: Check for missing dependencies or incorrect API versions

### Useful Commands

```bash
# Check org info
sf org display --target-org dev-org

# View org limits
sf org display limits --target-org dev-org

# Delete scratch org
sf org delete scratch --target-org dev-org

# Run tests
sf apex run test --test-level RunLocalTests --target-org dev-org
```
