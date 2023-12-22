# CREATED BY: Stewart Anderson
# DATE: NOV 7
# USAGE: Run 'python3 scripts/AddNameSpace.py' in terminal. Note that Python v3 or above needs to be installed on local machine.

import glob
import re
from os.path import exists
from typing import Optional

NAMESPACE_REPLACEMENT = f"%%%NAMESPACED_ORG%%%"
USE_NAMESPACE_REPLACEMENT = True
SEARCH_FOLDER = "force-app/main/default"


def update_files(RemoveOnlyMode: Optional[bool] = False):
    # FILES SPLIT TO ALLOW FOR EASIER READING

    all_files = []
    aura_files = glob.glob(SEARCH_FOLDER + "/aura/*.cmp", recursive=True)
    class_files = glob.glob(SEARCH_FOLDER + "/classes/*.cls", recursive=True)
    flow_files = glob.glob(SEARCH_FOLDER + "/flows/*.flow-meta.xml", recursive=True)
    d_rule_files = glob.glob(
        SEARCH_FOLDER + "/**/*.duplicateRule-meta.xml", recursive=True
    )
    vf_files = glob.glob(SEARCH_FOLDER + "/pages/*.page-meta.xml", recursive=True)
    m_rule_files = glob.glob(
        SEARCH_FOLDER + "/**/*.matchingRule-meta.xml", recursive=True
    )
    qa_rules = glob.glob(
        SEARCH_FOLDER + "/quickActions/*.quickAction-meta.xml", recursive=True
    )
    lwc2_rules = glob.glob(SEARCH_FOLDER + "/lwc/**/*.js-meta.xml", recursive=True)

    all_files.extend(aura_files)
    all_files.extend(class_files)
    all_files.extend(flow_files)
    all_files.extend(d_rule_files)
    all_files.extend(vf_files)
    all_files.extend(m_rule_files)
    all_files.extend(qa_rules)
    all_files.extend(lwc2_rules)

    # Process Each File Found
    for file in all_files:
        # Search for all custom references within file
        print(f"\n**Processing File**: {file}")
        with open(file, "r") as temp_file:
            temp_file.seek(0)
            temp_file_string = temp_file.read()

        # Update File String with new References
        temp_file_string = temp_file_string.replace(NAMESPACE_REPLACEMENT, "")

        if not RemoveOnlyMode:
            temp_file_string = re.sub(
                "[\w]+__c", f"{NAMESPACE_REPLACEMENT}\g<0>", temp_file_string
            )
            temp_file_string = re.sub(
                "[\w]+__r", f"{NAMESPACE_REPLACEMENT}\g<0>", temp_file_string
            )
            temp_file_string = re.sub(
                "[\w]+__s", f"{NAMESPACE_REPLACEMENT}\g<0>", temp_file_string
            )

        with open(file, "w") as tmpFile:
            tmpFile.write(temp_file_string)


# Run Task
update_files(True)
