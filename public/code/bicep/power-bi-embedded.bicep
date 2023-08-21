resource symbolicname 'Microsoft.PowerBIDedicated/capacities@2021-01-01' = {
  name: 'string'
  location: 'string'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  sku: {
    capacity: int
    name: 'string'
    tier: 'string'
  }
  properties: {
    administration: {
      members: [
        'string'
      ]
    }
    mode: 'string'
  }
  systemData: {
    createdAt: 'string'
    createdBy: 'string'
    createdByType: 'string'
    lastModifiedAt: 'string'
    lastModifiedBy: 'string'
    lastModifiedByType: 'string'
  }
}
