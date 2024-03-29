## General

Q: What is the difference between DCS Web Editor and DCS Web Viewer?  
A: The Viewer is intended for showcasing missions and mission planning. It has no ability to edit or change a mission. The Editor, on the other hand, can change or create new missions.

Q: When will the DCS Web Editor be released?  
A: The [DCS Web Viewer](https://dcs-web-editor.github.io/dcs-web-viewer-deploy/) has been released. The DCS Web Editor is available to contributors, patrons, and sponsors in both an ALPHA and BETA version. There is a 7 day free trial for DCS Web Editor Alpha or Beta Supporter access. https://www.patreon.com/DcsWebEditor/

Q: Will the DCS Web Editor & Viewer be free?  
A: Yes, the DCS Web Editor will be released as a free version after closed alpha and beta. [DCS Web Viewer](https://dcs-web-editor.github.io/dcs-web-viewer-deploy/) has already been released for free.

Q: Is there any way to support the developers?  
A: Yes, there's a few ways to do so. If you have suggestions that you feel would make the Editor better, head to [#⁠feature-requests](https://discord.gg/Er2ANYnByF) in [Discord](https://discord.gg/7G3qcmxmAX) and make your suggestions known! If you would like to contribute to the open source repository, head to [#⁠help-me-develop](https://discord.gg/b9cFQ9z4qC). If wish to support the developers otherwise, head to the [Patreon](https://www.patreon.com/DcsWebEditor).

Q: Is there a discord invite link?  
A: https://discord.gg/7G3qcmxmAX

Q: Where can I find more information about the Alpha?  
A: Checkout these docs, the [Discord](https://discord.gg/7G3qcmxmAX), and [Youtube](https://www.youtube.com/@dcs-web-editor). Stay tuned for the beta and public releases.

Q: Will multiple people be able to collaborate on the same mission together, at the same time?  
A: Yes, collaborative mission editing is a planned feature of the DCS Web Editor.

Q: How do I get Alpha access to the editor?  
A: There is now a 7 day free trial for DCS Web Editor Alpha and Beta Supporter access. Once you've signed up on [Patreon](https://www.patreon.com/DcsWebEditor), you need to connect your patreon account to discord ([https://www.patreon.com/settings/apps](https://www.patreon.com/settings/apps)). **Then it will take 1-6 hours** or so to get the Alpha/Beta Supporter discord role on this server. You can also leave the discord server and rejoin to update your roles faster. If your role does not appear within 60 minutes, drop me a message. Check the pinned posts in the alpha or beta channel.

## Editor

Q: The DCSmaps DCSM map layer isnt loading or shows grey tiles.  
A: It only works in the Caucasus area. For some browsers you may need to enable mixed content for the editor website, as dcsmaps tiles are served over http not https. You can also enable mixed content (just for this website) in Chrome. This allows it to load images over http, which is necessary until DCSmaps can serve map tiles via https.
[https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/mixed-content.html?lang=en](https://experienceleague.adobe.com/docs/target/using/experiences/vec/troubleshoot-composer/mixed-content.html?lang=en)

Q: Some map layers in DCS Web Viewer aren't working.  
A: Some map layers will show grey tiles as they require a map key. To enable all map layers go to [https://account.mapbox.com/auth/signup/](https://account.mapbox.com/auth/signup/), sign up for a free account and paste the mapbox key into the field in the menu. Then reload the browser.

Q: Its not working in my browser.  
A: Currently chrome-based browsers work best and have optimal performance. We recommend Chromium (open source Chrome without google). Second best are other Chromium-based browsers such as Chrome, Brave, Edge, Opera, Vivaldi etc.  
Least supported (for now) are 🦊 Firefox / 🦏 Safari due to differences in their APIs.  
[https://www.chromium.org/getting-involved/download-chromium/](https://www.chromium.org/getting-involved/download-chromium/)

- Please post bugs with a screenshot and your OS, browser / version so we can fix it for future releases.  
- If you are using Brave, you may wish to disable Shields for best results.

Q: Is there a way to improve performance?  
A: Yes, use the recommended browsers⁠ and in map layers:

- disable all 🐢🐢 (very slow) and maybe 🐢(slow) and enable all 🚀(fast)  
- disable ad blockers or other browser extensions that interfere with the DOM / website, they can slow down this app quite significantly

Q: The font is too small.  
A: This will be configurable later. For now, you can use the browser keys Ctrl + - or Cmd + - on mac.