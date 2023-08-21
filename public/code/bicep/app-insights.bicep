resource symbolicname 'Microsoft.Insights/components@2020-02-02' = {
  name: 'string'
  location: 'string'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  kind: 'string'
  etag: 'string'
  properties: {
    Application_Type: 'string'
    DisableIpMasking: bool
    DisableLocalAuth: bool
    Flow_Type: 'Bluefield'
    ForceCustomerStorageForProfiler: bool
    HockeyAppId: 'string'
    ImmediatePurgeDataOn30Days: bool
    IngestionMode: 'string'
    publicNetworkAccessForIngestion: 'string'
    publicNetworkAccessForQuery: 'string'
    Request_Source: 'rest'
    RetentionInDays: int
    SamplingPercentage: json('decimal-as-string')
    WorkspaceResourceId: 'string'
  }
}
