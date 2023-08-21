resource symbolicname 'Microsoft.ServiceFabric/clusters@2021-06-01' = {
  name: 'string'
  location: 'string'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  properties: {
    addOnFeatures: [
      'string'
    ]
    applicationTypeVersionsCleanupPolicy: {
      maxUnusedVersionsToKeep: int
    }
    azureActiveDirectory: {
      clientApplication: 'string'
      clusterApplication: 'string'
      tenantId: 'string'
    }
    certificate: {
      thumbprint: 'string'
      thumbprintSecondary: 'string'
      x509StoreName: 'string'
    }
    certificateCommonNames: {
      commonNames: [
        {
          certificateCommonName: 'string'
          certificateIssuerThumbprint: 'string'
        }
      ]
      x509StoreName: 'string'
    }
    clientCertificateCommonNames: [
      {
        certificateCommonName: 'string'
        certificateIssuerThumbprint: 'string'
        isAdmin: bool
      }
    ]
    clientCertificateThumbprints: [
      {
        certificateThumbprint: 'string'
        isAdmin: bool
      }
    ]
    clusterCodeVersion: 'string'
    diagnosticsStorageAccountConfig: {
      blobEndpoint: 'string'
      protectedAccountKeyName: 'string'
      protectedAccountKeyName2: 'string'
      queueEndpoint: 'string'
      storageAccountName: 'string'
      tableEndpoint: 'string'
    }
    eventStoreServiceEnabled: bool
    fabricSettings: [
      {
        name: 'string'
        parameters: [
          {
            name: 'string'
            value: 'string'
          }
        ]
      }
    ]
    infrastructureServiceManager: bool
    managementEndpoint: 'string'
    nodeTypes: [
      {
        applicationPorts: {
          endPort: int
          startPort: int
        }
        capacities: {}
        clientConnectionEndpointPort: int
        durabilityLevel: 'string'
        ephemeralPorts: {
          endPort: int
          startPort: int
        }
        httpGatewayEndpointPort: int
        isPrimary: bool
        isStateless: bool
        multipleAvailabilityZones: bool
        name: 'string'
        placementProperties: {}
        reverseProxyEndpointPort: int
        vmInstanceCount: int
      }
    ]
    notifications: [
      {
        isEnabled: bool
        notificationCategory: 'WaveProgress'
        notificationLevel: 'string'
        notificationTargets: [
          {
            notificationChannel: 'string'
            receivers: [
              'string'
            ]
          }
        ]
      }
    ]
    reliabilityLevel: 'string'
    reverseProxyCertificate: {
      thumbprint: 'string'
      thumbprintSecondary: 'string'
      x509StoreName: 'string'
    }
    reverseProxyCertificateCommonNames: {
      commonNames: [
        {
          certificateCommonName: 'string'
          certificateIssuerThumbprint: 'string'
        }
      ]
      x509StoreName: 'string'
    }
    sfZonalUpgradeMode: 'string'
    upgradeDescription: {
      deltaHealthPolicy: {
        applicationDeltaHealthPolicies: {}
        maxPercentDeltaUnhealthyApplications: int
        maxPercentDeltaUnhealthyNodes: int
        maxPercentUpgradeDomainDeltaUnhealthyNodes: int
      }
      forceRestart: bool
      healthCheckRetryTimeout: 'string'
      healthCheckStableDuration: 'string'
      healthCheckWaitDuration: 'string'
      healthPolicy: {
        applicationHealthPolicies: {}
        maxPercentUnhealthyApplications: int
        maxPercentUnhealthyNodes: int
      }
      upgradeDomainTimeout: 'string'
      upgradeReplicaSetCheckTimeout: 'string'
      upgradeTimeout: 'string'
    }
    upgradeMode: 'string'
    upgradePauseEndTimestampUtc: 'string'
    upgradePauseStartTimestampUtc: 'string'
    upgradeWave: 'string'
    vmImage: 'string'
    vmssZonalUpgradeMode: 'string'
    waveUpgradePaused: bool
  }
}
