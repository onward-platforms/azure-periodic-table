resource symbolicname 'Microsoft.Compute/galleries@2022-03-03' = {
  name: 'string'
  location: 'string'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  properties: {
    description: 'string'
    identifier: {}
    sharingProfile: {
      communityGalleryInfo: {
        eula: 'string'
        publicNamePrefix: 'string'
        publisherContact: 'string'
        publisherUri: 'string'
      }
      permissions: 'string'
    }
    softDeletePolicy: {
      isSoftDeleteEnabled: bool
    }
  }
}
