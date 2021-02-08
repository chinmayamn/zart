<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Profile" %>
<%@ Import Namespace="System.Design" %>
<%@ Import Namespace="ZartShopping" %>
<%@ Import Namespace="ZartCartItem" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
   void Profile_OnMigrateAnonymous(object sender, ProfileMigrateEventArgs args)
    {
        ProfileCommon anonymousProfile = Profile.GetProfile(args.AnonymousID);


        foreach (CartItem item in anonymousProfile.ZartShopping.Items)
        {
            Profile.ZartShopping.Insert(item.ProductId, item.ProductName, item.ProductImageUrl, item.quantity, item.discount, item.Color, item.Size, item.Brand, item.price, item.Tax);
        }
  //Profile.ZartShopping.Insert(anonymousProfile.ZartShopping.;
        //foreach (var property in anonymousProfile.PropertyValues)
        //{
        //    //Profile.SetPropertyValue(property.Name, property.PropertyValue);
        //    Profile.SetPropertyValue(Profile.z
        //}

        //Profile.Age = anonProfile.Age;
        //Profile.LuckyNumber = anonProfile.LuckyNumber;
        //Profile.Pets = anonProfile.Pets;
        AnonymousIdentificationModule.ClearAnonymousIdentifier();
    }
</script>
