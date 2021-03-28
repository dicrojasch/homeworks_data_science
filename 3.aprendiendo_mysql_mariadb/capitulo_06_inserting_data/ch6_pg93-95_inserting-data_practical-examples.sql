USE rookery;

ALTER TABLE bird_orders
AUTO_INCREMENT = 100;

INSERT INTO bird_orders (scientific_name, brief_description)
VALUES('Anseriformes', "Waterfowl"),
 ('Galliformes', "Fowl"),
 ('Charadriiformes', "Gulls, Button Quails, Plovers"),
 ('Gaviiformes', "Loons"),
 ('Podicipediformes', "Grebes"),
 ('Procellariiformes', "Albatrosses, Petrels"),
 ('Sphenisciformes', "Penguins"),
 ('Pelecaniformes', "Pelicans"),
 ('Phaethontiformes', "Tropicbirds"),
 ('Ciconiiformes', "Storks"),
 ('Cathartiformes', "New-World Vultures"),
 ('Phoenicopteriformes', "Flamingos"),
 ('Falconiformes', "Falcons, Eagles, Hawks"),
 ('Gruiformes', "Cranes"),
 ('Pteroclidiformes', "Sandgrouse"),
 ('Columbiformes', "Doves and Pigeons"),
 ('Psittaciformes', "Parrots"),
 ('Cuculiformes', "Cuckoos and Turacos"),
 ('Opisthocomiformes', "Hoatzin"),
 ('Strigiformes', "Owls"),
 ('Struthioniformes', "Ostriches, Emus, Kiwis"),
 ('Tinamiformes', "Tinamous"),
 ('Caprimulgiformes', "Nightjars"),
 ('Apodiformes', "Swifts and Hummingbirds"),
 ('Coraciiformes', "Kingfishers"),
 ('Piciformes', "Woodpeckers"),
 ('Trogoniformes', "Trogons"),
 ('Coliiformes', "Mousebirds"),
 ('Passeriformes', "Passerines");