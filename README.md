# riverpod_prectice

* Riverpod ব্যবহার করলে সবার উপরে ProviderScope দিতে হয়।
* যদি ProviderScope না দাও, তাহলে riverpod জানবেই না কোন state কোথায় store হচ্ছে।
* ConsumerWidget ছাড়া তুমি ref পাবা না → তাই provider এর state access করতে পারবে না।
* এক কথায়: “ConsumerWidget হলো Riverpod এর interface যা দিয়ে provider এর state UI তে দেখানো যায়।”
### StatelessWidget + Consumer ====যখন performance গুরুত্বপূর্ণ, বড় widget tree আছে, শুধুমাত্র ছোট অংশ rebuild করতে হবে
### ConsumerWidget             ====যখন পুরো widget ছোট এবং state change হলে পুরোটা rebuild হলেও কোনো সমস্যা নেই
* https://github.com/Uuttssaavv/flutter-clean-architecture-riverpod
* https://dev.to/ssoad/flutter-riverpod-clean-architecture-the-ultimate-production-ready-template-for-scalable-apps-gdh
* https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/
