# LockConfigurer
Mini App

<img width="300" alt="AppIconCap" src="https://github.com/Ghassen21/LockConfigurer/assets/72602715/223c9b1e-3354-437c-9869-81796f469dd3">

![Untitled design](https://github.com/Ghassen21/LockConfigurer/assets/72602715/f403b4ef-1768-41c0-b302-05135f93b48b)


LockConfigurer is a mini mobile app simulation that enables a busy service technician to efficiently configure parameters related to the installation of locks on a door. It allows for editing various parameters, such as lock voltage value and estimated release time value, providing different options as examples. 

# The design pattern architecture of the app is implemented with the  Model-View-ViewModel (MVVM) pattern. 

It consists of several directories:
Views directory, which contains all the views such as LockParametersConfigView, as well as navigation detailed views like LockVoltageParameterDetailView and LockReleaseTimeDetailView.
Model directory, which contains the LockConfigurationModel.
ViewModel directory, which contains the LockConfigurationViewModel responsible for updating both the model and the view.
NetworkApiService directory, which contains LockConfigurationNetworkApiService responsible for making API calls to fetch data.

# The implementation of this design pattern is based on several benefits.

It keeps things organized by separating different parts of the app, making it easier to manage and understand. Secondly, it simplifies testing and reusability because each part can be tested individually and reused in different places. Lastly, it offers better scalability and flexibility, allowing the app to grow and adapt more smoothly to future changes.
