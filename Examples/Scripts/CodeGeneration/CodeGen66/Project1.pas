pas : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Project>> Project1
�������� �������� 
 pas : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Library>> Library1
 �������� �������� ::Project1
 ; // Library1
 pas : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Library>> Library2
 �������� �������� ::Project1
 ; // Library2
 pas : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Library>> Library3
 �������� �������� ::Project1
 ; // Library3
 pas : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Program>> Program1
 �������� �������� ::Project1
  pas : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class1
  �������� �������� ::Project1::Program1
  ; // Class1
  pas : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class2
  �������� �������� ::Project1::Program1
  Class1
  Interface1
  Interface2
  ; // Class2
  pas : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class3
  �������� �������� ::Project1::Program1
  ; // Class3
  pas : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class4
  �������� �������� ::Project1::Program1
  Class2
  Class3
  ; // Class4
  pas : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Interface>> Interface1
  �������� �������� ::Project1::Program1
  ; // Interface1
  pas : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Interface>> Interface2
  �������� �������� ::Project1::Program1
  ; // Interface2
 ; // Program1
; // Project1
