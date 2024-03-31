# LockConfigurer
Mini App

![AppIcon](https://github.com/Ghassen21/LockConfigurer/assets/72602715/00d829af-8e21-49ac-8e67-f5e8a899152a)

LockConfigurer is a mini mobile app simulation that enables a busy service technician to efficiently configure parameters related to the installation of locks on a door. It allows for editing various parameters, such as lock voltage value and estimated release time value, providing different options as examples. 

The design pattern architecture of the app is implemented with the # Model-View-ViewModel (MVVM) pattern. It consists of several directories:
Views directory, which contains all the views such as LockParametersConfigView, as well as navigation detailed views like LockVoltageParameterDetailView and LockReleaseTimeDetailView.
Model directory, which contains the LockConfigurationModel.
ViewModel directory, which contains the LockConfigurationViewModel responsible for updating both the model and the view.
NetworkApiService directory, which contains LockConfigurationNetworkApiService responsible for making API calls to fetch data.
