# Abstract Sequential Query constructor
This is an experimental project, made mostly for fun. The goal is to construct some abstract system to work with sequential queries. 

The example of a typical secuantional quary:

    auto result = db.someTable
      .where(x => x.Dleted == false && x.id != null)
      .select(x => [x.id, x.name])
      .distinct()
      .limit(1000)
      .do();

As I suppose, it is possible to formalize such chains as a syntax tree:

    .someTable
    .where
      (&&)
        ├──(==)
        │    ├──(.)
        │    │   ├──(x)
        │    │   └──(id)
        │    └──(false)
        └──(!=)
             ├──(.)
             │   ├──(x)
             │   └──(id)
             └──(null)
     .select
       ([])
         ├──(.)
         │   ├──(x)
         │   └──(id)
         └──(.)
             ├──(x)
             └──(name)
      .distinct
      .limit
        (1000)
      .do
      
My dream is to generate SQL-queries based on this tree structures. Well, someday maybe...
Any way, now this project is far from perfection.
