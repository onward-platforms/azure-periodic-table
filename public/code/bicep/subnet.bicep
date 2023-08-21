resource symbolicname 'Microsoft.Network/virtualNetworks/subnets@2023-04-01' = {
  name: 'string'
  parent: resourceSymbolicName
  properties: {
    addressPrefix: 'string'
    addressPrefixes: [
      'string'
    ]
    applicationGatewayIPConfigurations: [
      {
        id: 'string'
        name: 'string'
        properties: {
          subnet: {
            id: 'string'
          }
        }
      }
    ]
    delegations: [
      {
        id: 'string'
        name: 'string'
        properties: {
          serviceName: 'string'
        }
        type: 'string'
      }
    ]
    ipAllocations: [
      {
        id: 'string'
      }
    ]
    natGateway: {
      id: 'string'
    }
    networkSecurityGroup: {
      id: 'string'
      location: 'string'
      properties: {
        flushConnection: bool
        securityRules: [
          {
            id: 'string'
            name: 'string'
            properties: {
              access: 'string'
              description: 'string'
              destinationAddressPrefix: 'string'
              destinationAddressPrefixes: [
                'string'
              ]
              destinationApplicationSecurityGroups: [
                {
                  id: 'string'
                  location: 'string'
                  properties: {}
                  tags: {}
                }
              ]
              destinationPortRange: 'string'
              destinationPortRanges: [
                'string'
              ]
              direction: 'string'
              priority: int
              protocol: 'string'
              sourceAddressPrefix: 'string'
              sourceAddressPrefixes: [
                'string'
              ]
              sourceApplicationSecurityGroups: [
                {
                  id: 'string'
                  location: 'string'
                  properties: {}
                  tags: {}
                }
              ]
              sourcePortRange: 'string'
              sourcePortRanges: [
                'string'
              ]
            }
            type: 'string'
          }
        ]
      }
      tags: {}
    }
    privateEndpointNetworkPolicies: 'string'
    privateLinkServiceNetworkPolicies: 'string'
    routeTable: {
      id: 'string'
      location: 'string'
      properties: {
        disableBgpRoutePropagation: bool
        routes: [
          {
            id: 'string'
            name: 'string'
            properties: {
              addressPrefix: 'string'
              hasBgpOverride: bool
              nextHopIpAddress: 'string'
              nextHopType: 'string'
            }
            type: 'string'
          }
        ]
      }
      tags: {}
    }
    serviceEndpointPolicies: [
      {
        id: 'string'
        location: 'string'
        properties: {
          contextualServiceEndpointPolicies: [
            'string'
          ]
          serviceAlias: 'string'
          serviceEndpointPolicyDefinitions: [
            {
              id: 'string'
              name: 'string'
              properties: {
                description: 'string'
                service: 'string'
                serviceResources: [
                  'string'
                ]
              }
              type: 'string'
            }
          ]
        }
        tags: {}
      }
    ]
    serviceEndpoints: [
      {
        locations: [
          'string'
        ]
        service: 'string'
      }
    ]
  }
}
