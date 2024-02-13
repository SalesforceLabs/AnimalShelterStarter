# Animal Shelter Starter

Animal Shelter Starter provides the foundation to use Salesforce for managing animals, treatments, conditions, housing and related activities.

The team within Salesforce.org have configured Animal, Treatment, Condition, Adoption and Exercise objects, along with Flows and Automation which you can install and adapt to your requirements, in addition, these are already linked to standard objects within Salesforce, such as Contacts and Accounts.

Animal Shelter Starter is built to scale with your organisation, providing you with a foundation to begin managing your animals from rescue to recovery and beyond. Utilising the Salesforce platform, you will be able to take full control of your operations with the power of the world’s leading CRM.

# Development

Please note that you must have access to the managed package namespace before you can work on this package. Please reach out to the team if you internal to Salesforce and want to work on this package.

### Dependencies

- VSCode > https://code.visualstudio.com/download
- Salesforce Extension Pack > https://marketplace.visualstudio.com/items?itemName=salesforce.salesforcedx-vscode
- CumulusCI > https://cumulusci.readthedocs.io/en/latest/get-started.html
- Salesforce DX > https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm
- GitHub Desktop > https://docs.github.com/en/desktop/installing-and-authenticating-to-github-desktop/installing-github-desktop

### DevHub

Request access to the DevHub from Stewart Anderson. Once you have a username and password do the follow:

1. Open the command pallette in VSCode and select "SFDX: Authorize a DevHub"
2. Login with you details
3. Done

### Development Process

Before you start development of a new fix or feature, ensure you have created a new branch from the master branch and then open that with VSCode. This is best done on the GitHub page.

1. Once you have opened this repo locally within VSCode, start by creating a scratch org. You can use the command pallette for this, on MacOS you can use Cmd + Shift + p within VSCode. Choose the option called "SFDX: Create a default scratch org...". Accept the default options to create the org.
2. Once created, right-click on the force-app folder and select "SFDX: Deploy Source to Org". This will deploy the current package source to the scratch org.
3. Make required changes in the scratch org. Remember to add any required permissions for objects, fields etc to the Animal Shelter Starter permission set.
4. Pull changes back to VSCode by using the command pallette and select "SFDX: Pull Source from Default Org and override conflicts".
5. Switch to GitHub Desktop and provide details for the changes and then push the changes back to GitHub.
6. Once you are happy with your changes, re-open the GitHub page and create a Pull Request for your feature branch back to the master branch.
7. Done

Note: If you don't use CumulusCI then you will need to assign the Animal Shelter Starter permission set to the user when you first login to the org.

### Using SalesforceDX and CumulusCI

It can be useful to have access to the suite of tools within CumulusCI. To make use of these you need to import the SalesforceDX org to CumulusCI by running this command in the terminal:

`cci org import sfdx_alias_here dev`

In the example command above, replace sfdx_alias_here with the alias for the org. This often defaults AnimalShelterStarter and then the second argument (dev in the example) can be set to whatever you want to use as the alias for cci, dev is often the default but you can change it anything.

Once the command has run, you can then launch tasks and flows via CumulusCI. One useful which has been added is the post_config flow which can be run using:

`cci flow run post_config --org cci_org_alias_here`

Replace the cci_org_alias_here with the alias you chose above when importing the SalesforceDX org to CumulusCI. This flow will assign the Animal Shelter Starter permission set and load in some sample data.
