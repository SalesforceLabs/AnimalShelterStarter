# CREATED BY: Stewart Anderson
# DATE: NOV 7
# USAGE: Run 'python3 scripts/AddNameSpace.py' in terminal. Note that Python v3 or above needs to be installed on local machine.

import glob
import re
from os.path import exists

NAMESPACE_REPLACEMENT = f"%%%NAMESPACED_ORG%%%"
USE_NAMESPACE_REPLACEMENT = True
SEARCH_FOLDER = "force-app/main/default"

def replace_file_text(file_location, old_text, new_text):
    """ Replace specific text within a file
    :param file_location: Relative path and file name of the file you want to replace text within
    :param old_text: Text string to search for
    :param new_text: New text to replace old text
    """
    if not exists(file_location):
        raise Exception(f"Error: File Path does not exist. Check the file {file_location}")

    with open(f"{file_location}", "r") as tmpFile:
        tmpFile.seek(0)
        fcontents = tmpFile.read()


    new_fcontents = fcontents.replace(f"{old_text}", f"{new_text}")

    with open(f"{file_location}", "w") as tmpFile:
        tmpFile.write(new_fcontents)

def update_files():
  
  all_files = []
  aura_files = glob.glob(SEARCH_FOLDER + "/**/*.cmp", recursive=True)
  class_files = glob.glob(SEARCH_FOLDER + "/**/*.cls-meta.xml", recursive=True)
  flow_files = glob.glob(SEARCH_FOLDER + "/**/*.flow-meta.xml", recursive=True)
  d_rule_files = glob.glob(SEARCH_FOLDER + "/**/*.duplicateRule-meta.xml", recursive=True)
  vf_files = glob.glob(SEARCH_FOLDER + "/**/*.page-meta.xml", recursive=True)
  m_rule_files = glob.glob(SEARCH_FOLDER + "/**/*.matchingRule-meta.xml", recursive=True)

  all_files.extend(aura_files)
  all_files.extend(class_files)
  all_files.extend(flow_files)
  all_files.extend(d_rule_files)
  all_files.extend(vf_files)
  all_files.extend(m_rule_files)

  for file in all_files:

    replace_file_text(file, NAMESPACE_REPLACEMENT, "")

    # Search for all references within file
    with open(file, "r") as temp_file:
      temp_file.seek(0)
      temp_file_string = temp_file.read()

      items_to_replace = []
      custom_references = re.findall("[\w]+__c", temp_file_string)
      lookup_references = re.findall("[\w]+__r", temp_file_string)
      gps_references = re.findall("[\w]+__s", temp_file_string)

      items_to_replace.extend(custom_references)
      items_to_replace.extend(lookup_references)
      items_to_replace.extend(gps_references)

    print(f"\n**Processing File**: {file}")

    # De-dupe List
    original_count = len(items_to_replace)
    items_to_replace = list(dict.fromkeys(items_to_replace))

    if len(items_to_replace) > 0:
      print(f"    {len(items_to_replace)} Unique References Found ({original_count} Total References in file)")
      for item in items_to_replace:
        replace_file_text(file, item, f"{NAMESPACE_REPLACEMENT}{item}")
        print(f"      Updated Reference: {item} to {NAMESPACE_REPLACEMENT}{item}")
    else:
      print(f"      Skipping File: {file} as no custom references were found.")


update_files()
