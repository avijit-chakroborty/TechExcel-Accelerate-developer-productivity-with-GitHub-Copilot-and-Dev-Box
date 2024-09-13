@description('Environment of the web app')
param environment string = 'dev'

@description('Location of services')
param location string = resourceGroup().location

var webAppName = '${uniqueString(resourceGroup().id)}-${environment}'
var appServicePlanName = '${uniqueString(resourceGroup().id)}-mpnp-asp'
var logAnalyticsName = '${uniqueString(resourceGroup().id)}-mpnp-la'
var appInsightsName = '${uniqueString(resourceGroup().id)}-mpnp-ai'
var sku = 'S1'
var registryName = '${uniqueString(resourceGroup().id)}mpnpreg'
var registrySku = 'Standard'
var imageName = 'techexcel/dotnetcoreapp'
var startupCommand = ''

// TODO: complete this script
module webApp '1.0.0' = {
  name: webAppName
  location: location
  tags: {
    environment: environment
  }
  properties: {
    serverFarmId: appServicePlanId
    siteConfig: {
      appSettings: [
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsightsKey
        }
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: appInsightsConnectionString
        }
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: registryLoginServer
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: registryUsername
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: registryPassword
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: registryPassword
        }
        {
          name: 'DOCKER_REGISTRY_IMAGE'
          value: imageName
        }
        {
          name: 'DOCKER_CUSTOM_IMAGE_NAME'
          value: imageName
        }
        {
          name: 'DOCKER_CUSTOM_IMAGE_TAG'
          value: 'latest'
        }
        {
          name: 'DOCKER_ENABLE_CI'
          value: 'true'
        }
        {
          name: 'DOCKER_CUSTOM_IMAGE_NAME'
          value: imageName
        }
        {
          name: 'DOCKER_CUSTOM_IMAGE_TAG'
          value: 'latest'
        }
        {
          name: 'DOCKER_ENABLE_CI'
          value: 'true'
        }
      ]
    }
  }
}

//  The  webApp  module is the main module that creates the web app. It uses the  webAppName  and  location  variables to create the web app. The  tags  property is used to tag the web app with the environment. The  properties  property is used to configure the web app. The  serverFarmId  property is used to specify the app service plan that the web app should use. The  siteConfig  property is used to configure the web app settings. The  appSettings  property is used to specify the app settings for the web app. The app settings include the instrumentation key, connection string, and other settings that are required for the web app to run. 
//  The  appServicePlanId ,  appInsightsKey ,  appInsights
