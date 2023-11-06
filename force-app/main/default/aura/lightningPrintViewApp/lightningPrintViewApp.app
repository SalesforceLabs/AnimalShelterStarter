<aura:application extends="force:slds">
  <aura:attribute name="recordid" type="String" />
  <aura:attribute name="fieldSetName" type="String" />
  <aura:attribute name="sObjectTypeName" type="String" />

  <div class="slds-clearfix slds-p-around_medium">
    <div class="slds-float_right">
      <lightning:button aura:id="printButton" class="" label="Print" onclick="{!c.print}" />
    </div>
  </div>

  <c:lightningPrintView recordId="{!v.recordid}" fieldSetName="{!v.fieldSetName}"
    sObjectTypeName="{!v.sObjectTypeName}" />

</aura:application>
