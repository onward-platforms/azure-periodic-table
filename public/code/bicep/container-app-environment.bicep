resource symbolicname 'Microsoft.App/managedEnvironments@2023-05-01' = {
  name: 'string'
  location: 'string'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  kind: 'string'
  properties: {
    appLogsConfiguration: {
      destination: 'string'
      logAnalyticsConfiguration: {
        customerId: 'string'
        sharedKey: 'string'
      }
    }
    customDomainConfiguration: {
      certificatePassword: 'string'
      certificateValue: any()
      dnsSuffix: 'string'
    }
    daprAIConnectionString: 'string'
    daprAIInstrumentationKey: 'string'
    daprConfiguration: {}
    infrastructureResourceGroup: 'string'
    kedaConfiguration: {}
    peerAuthentication: {
      mtls: {
        enabled: bool
      }
    }
    vnetConfiguration: {
      dockerBridgeCidr: 'string'
      infrastructureSubnetId: 'string'
      internal: bool
      platformReservedCidr: 'string'
      platformReservedDnsIP: 'string'
    }
    workloadProfiles: [
      {
        maximumCount: int
        minimumCount: int
        name: 'string'
        workloadProfileType: 'string'
      }
    ]
    zoneRedundant: bool
  }
}
