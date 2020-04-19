# CoreDataAfterHours
Save your favorite character from What We Do In the Shadows

### Notes:
* Networking.playground in the resources group
  This was used to download the mock JSON Data-String used to decode the characters

* CoreDataStack was included to save time. This is pretty much boilerplate code, though you may notice it's done slightly differently. This is to allow for Multiple Contexts, honestly because this is the snippet I have saved for CoreData. It's set to use the mainContext by default and this is what we're using throughout since there's no networking in the actual project (just in the playground).
