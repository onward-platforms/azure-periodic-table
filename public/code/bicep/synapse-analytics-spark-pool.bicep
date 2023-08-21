resource symbolicname 'Microsoft.Synapse/workspaces/bigDataPools@2021-06-01' = {
  name: 'string'
  location: 'string'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  parent: resourceSymbolicName
  properties: {
    autoPause: {
      delayInMinutes: int
      enabled: bool
    }
    autoScale: {
      enabled: bool
      maxNodeCount: int
      minNodeCount: int
    }
    customLibraries: [
      {
        containerName: 'string'
        name: 'string'
        path: 'string'
        type: 'string'
      }
    ]
    defaultSparkLogFolder: 'string'
    dynamicExecutorAllocation: {
      enabled: bool
      maxExecutors: int
      minExecutors: int
    }
    isAutotuneEnabled: bool
    isComputeIsolationEnabled: bool
    libraryRequirements: {
      content: 'string'
      filename: 'string'
    }
    nodeCount: int
    nodeSize: 'string'
    nodeSizeFamily: 'string'
    provisioningState: 'string'
    sessionLevelPackagesEnabled: bool
    sparkConfigProperties: {
      configurationType: 'string'
      content: 'string'
      filename: 'string'
    }
    sparkEventsFolder: 'string'
    sparkVersion: 'string'
  }
}
