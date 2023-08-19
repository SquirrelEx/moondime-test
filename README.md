# MoonDime - Proof of Concept

While systematic investment plans allow for a user to set small recurring purchases, MoonDime as an app gamifies this with real time triggers towards small investments into chosen cryptocurrencies.
On top of the users initial investments the user is incentivized to use the application via a native ethereum token "MoonDime (MDT)" currently on the Goerli Ethereum Testnet awarded on eachround of investment.
This application is a take on the concept of investing spare change or tiny amounts through the day, only to withdraw if there is a large spike in certain cryptocurrencies. The upsides could be large and the downside would be one incurring losses in the form of change through time.

 A clear example of how the app would work may be, a user choosing location as a trigger, this could be the user's office - upon reaching his/her office on a daily basis, a tiny user set amount like 4HKD could be invested towards an equivalent coin such as ethereum along with 1 MDT received in the users' web3 wallet. At any point in time, the user could withdraw the fiat balance by converting the portfolio of coins and MDT with a minor trading fee. 

# 🖼️ Screenshot Walk Through


| <img src="https://i.imgur.com/8P5oycO.png" width="300"> | <img src="https://i.imgur.com/KHysBgB.png" width="300"> |
| --------------------------------------------------------|-------------------------------------------------------- |

The user is required to fill in a web3 wallet address that will be used to store the assets, an email and choose a password to sign into the application.


| <img src="https://i.imgur.com/pBG37jh.png" width="300"> | <img src="https://i.imgur.com/G1ZD0Cp.png" width="300"> |
| ------------------------------------------------------- | ------------------------------------------------------- |
| <img src="https://i.imgur.com/p7UYWx9.png" width="300"> | <img src="https://i.imgur.com/BoXgUlo.png" width="300"> |


Showcase the flow of a user creating a trigger on an iOS 12+ device. The flow goes from adding a label - one could have several triggers so a nickname helps) followed by setting a location and its range followed by finally showcasing the trigger set and enabled.
After creating triggers the user may decide if he wishes to keep these “on” or “off”.


| <img src="https://i.imgur.com/jMK2JNF.png" width="700"> |
| ------------------------------------------------------- |

The result of simulating a location on the device itself, triggering this prompt which will send a minor ring if the app is open during the timeof event being triggered. The prompt showcases current wallet balance in test Ethereum (or the amount of MoonDime is now present in wallet).
If the app is closed a notification can be posted with any relevant detail passed along.


| <img src="https://i.imgur.com/j0t3skw.png" width="700"> |
| ------------------------------------------------------- |
Showcases the MoonDime Token Minted into the user's wallet.


| <img src="https://i.imgur.com/jnIhESR.png" width="700"> |
| ------------------------------------------------------- |
Showcases the transfer of ETH into the users wallet.




# 📝 Notes

* Alarm will ring for only 60 seconds and it will stop automatically.
* Alarm will ring even if the app is not active or closed.
* If an alarm will ring when the app is closed, a notification will be send indicating that alarm is ringing, and you can stop it from that notification by swiping down and click on "Stop".
* If you dismissed the notification without stoping the alarm, the alarm will continue ringing for 60 seconds, or until you open the app and stop it from there.
* By enabling "Repeat" option in alarm settings, the alarm will ring everytime you enter the location region, otherwise, it will ring only once and it will be disabled after that.
# moondime-test
