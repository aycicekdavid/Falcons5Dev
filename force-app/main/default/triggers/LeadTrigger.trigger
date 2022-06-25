trigger LeadTrigger on Lead(before insert, before update) {
  //Yeni Lead oluşturulduğunda ya da update edildiğinde, Salutation olarak ‘Dr.’ ekleyecek
  //Object : lead
  //before insert
  //before update

  List<Lead> lst = Trigger.new;

  if (Trigger.isInsert || Trigger.isUpdate) {
    for (Lead each : lst) {
      if (!each.FirstName.contains('Dr.')) {
        each.FirstName = 'Dr. ' + each.FirstName;
        System.debug(each.FirstName);
      }
    }
  }
}
