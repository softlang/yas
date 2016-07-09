CREATE TABLE family (
  objectId INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(42) NOT NULL
);

CREATE TABLE person (
  objectId INTEGER NOT NULL PRIMARY KEY,
  firstName VARCHAR(42) NOT NULL,
  lastName VARCHAR(42) NOT NULL,
  closestFriend INTEGER FOREIGN KEY REFERENCES person (objectId)
);

CREATE TABLE family_members (
  familyId INTEGER NOT NULL FOREIGN KEY REFERENCES family (objectId),
  members INTEGER NOT NULL FOREIGN KEY REFERENCES person (objectId)
);

CREATE TABLE person_emailAddresses (
  personId INTEGER NOT NULL FOREIGN KEY REFERENCES person (objectId),
  emailAddresses VARCHAR(42) NOT NULL
);
