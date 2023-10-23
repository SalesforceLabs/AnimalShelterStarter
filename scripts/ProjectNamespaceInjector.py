# CREATED BY: Stewart Anderson
# CREATED DATE: 07 NOVEMBER 2022
#
# USAGE:
#
# 1. Copy this file to the root of your CumulusCI Project Folder
# 2. Right-click and run the file in Terminal.
# 3. Done
#

import fileinput
import glob
import os
import re

NAMESPACE_REPLACEMENT = "%%%NAMESPACED_ORG%%%"
SEARCH_FOLDER = "force-app/main/default"
FILE_PATTERNS = [
    "/aura/*.cmp",
    "/classes/*.cls",
    "/flows/*.flow-meta.xml",
    "/**/*.duplicateRule-meta.xml",
    "/pages/*.page-meta.xml",
    "/**/*.matchingRule-meta.xml",
    "/quickActions/*.quickAction-meta.xml",
    "/lwc/**/*.js-meta.xml",
]


def update_files(
    namespace_placeholder: str = None,
    search_directory: str = None,
    remove_prefix_mode: bool = False,
):
    """
    Updates the custom object references throughout the files held within the search directory which is assumed to have a default Salesforce DX structure.

    Args:
      namespace_placeholder (str): The placeholder which will be applied to all matches.
      search_directory (str): The relative file path from the root of the CumulusCI Project to the directory which holds the SFDX format metadata.
      remove_prefix_mode (bool): Removes the given namespace placeholder only (if found) when True otherwise will ensure all matches have a namespace placeholder.

    """

    # Process initial Checks
    if not namespace_placeholder:
        namespace_placeholder = (
            input(
                f"Please confirm the placeholder which will be replaced, the default is '{NAMESPACE_REPLACEMENT}': "
            )
            or NAMESPACE_REPLACEMENT
        )

    if not search_directory:
        search_directory = (
            input(
                f"Please confirm the search directory path which you want to search within, the default is {SEARCH_FOLDER}: "
            )
            or SEARCH_FOLDER
        )

    remove_prefix_confirmation = (
        input("Do you want to only remove the current prefixes (if found)? Y/n ") or "y"
    )
    remove_prefix_mode = True if remove_prefix_confirmation.lower() == "y" else False

    if not os.path.exists(search_directory):
        print(
            "Error: The file path defined does not exist. Please update the file path and try again."
        )
        return

    # Locate all relevant files
    all_files = []

    for pattern in FILE_PATTERNS:
        all_files.extend(glob.glob(SEARCH_FOLDER + pattern, recursive=True))

    # Process Each File Found
    for file in all_files:
        print(f"\n**Processing File**: {file}")
        with fileinput.input(
            files=(file,), inplace=True, encoding="utf-8"
        ) as file_to_check:
            for line in file_to_check:
                updated_line = line.replace(NAMESPACE_REPLACEMENT, "")

                if not remove_prefix_mode:
                    updated_line = re.sub(
                        "[\w]+__[crs]", f"{NAMESPACE_REPLACEMENT}\g<0>", updated_line
                    )

                print(updated_line, end="")


# Run Task
if __name__ == "__main__":
    update_files()
