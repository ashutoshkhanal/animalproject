import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class Description extends StatefulWidget {
  String value;
  String desc;

  Description({this.value});

  setState() {
    value = this.value;
  }

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  final describe = [
    {
      "name": "Dog",
      "Description":
          "The dog or domestic dog (Canis familiaris or Canis lupus familiaris) is a domesticated descendant of the wolf which is characterized by an upturning tail. "
              "The dog derived from an ancient, extinct wolf,and the modern grey wolf is the dog's nearest living relative.he dog was the first species to be domesticated, by hunter–gatherers over 15,000 years ago,before the development of agriculture."
              "\n \nDue to their long association with humans, dogs have expanded to a large number of domestic individuals[10] and gained the ability to thrive on a starch-rich diet that would be inadequate for other canids.Over the millennia, dogs became uniquely adapted to human behavior, and the human-canine bond has been a topic of frequent study"
              "\n \n Classification of Dog"
              "\n\n Kingdom:	Animalia"
              "\n \n  Phylum:	Chordata"
              "\n \n  Class:	Mammalia"
              "\n \n  Order:	Carnivora"
              "\n \n  Family:	Canidae"
              "\n \n  Genus:	Canis"
              "\n \n  Species:	C. familiaris",
      "image": "assets/dog.jpg",
      "audio": 'assets/dog.mp3',
      "class": "Canis lupus familiaris"
    },
    {
      "name": "Cat",
      "Description":
          "The cat (Felis catus) is a domestic species of small carnivorous mammal.It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.A cat can either be a house cat, a farm cat or a feral cat; the latter ranges freely and avoids human contact."
              "\n\nThe cat is similar in anatomy to the other felid species: it has a strong flexible body, quick reflexes, sharp teeth and retractable claws adapted to killing small prey. Its night vision and sense of smell are well developed. Cat communication includes vocalizations like meowing, purring, trilling, hissing, growling and grunting as well as cat-specific body language"
              "\n \n Classification of Cat"
              "\n\n  Kingdom:	Animalia"
              "\n \n  Phylum:	Chordata"
              "\n \n  Class:	Mammalia"
              "\n \n  Order:	Carnivora"
              "\n \n  Suborder:	Feliformia"
              "\n \n  Family:	Felidae"
              "\n \n  Subfamily:	Felinae"
              "\n \n  Genus:	Felis"
              "\n \n  Species:	F. catus",
      "image": "assets/cat.jpg",
      "audio": "assets/cat.mp3",
      "class": "Felis catus"
    },
    {
      "name": "Chicken",
      "Description":
          "The chicken (Gallus gallus domesticus) is a domesticated subspecies of the red junglefowl originally from Southeastern Asia. Rooster or cock is a term for an adult male bird, and a younger male may be called a cockerel. A male that has been castrated is a capon. An adult female bird is called a hen and a sexually immature female is called a pullet."
              "\nOriginally raised for cockfighting or for special ceremonies, chickens were not kept for food until the Hellenistic period (4th–2nd centuries BC). Humans now keep chickens primarily as a source of food (consuming both their meat and eggs) and as pets."
              "\n\nChickens are one of the most common and widespread domestic animals, with a total population of 23.7 billion as of 2018,[3] up from more than 19 billion in 2011. There are more chickens in the world than any other bird. There are numerous cultural references to chickens – in myth, folklore and religion, and in language and literature."
              "\n \n Classification of Chicken"
              "\n\n  Kingdom:	Animalia"
              "\n \n Phylum:	Chordata"
              "\n \n Class:	Aves"
              "\n \n Order:	Galliformes"
              "\n \n Family:	Phasianidae"
              "\n \n Genus:	Gallus"
              "\n \n Species:	G. gallus"
              "\n \n Subspecies:	G. g. domesticus",
      "image": "assets/chicken.jpg",
      "audio": "assets/chicken.mp3",
      "class": "Gallus gallus domesticus"
    },
    {
      "name": "Horse",
      "Description":
          "The horse (Equus ferus caballus)is a domesticated one-toed hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus. The horse evolved over the past 45 to 55 million years from Eohippus, a small multi-toed creature, into the large, single-toed animal of today. Humans began domesticating horses around 4000 BC, and their domestication is believed to have been widespread by 3000 BC. Specifically, horses in the subspecies caballus are domesticated, although some domesticated populations live in the wild as feral horses. However, these feral populations are not true wild horses, as this term is used to describe horses that have never been domesticated. There is an extensive, specialized vocabulary used to describe equine-related concepts, covering everything from anatomy to life stages, size, colors, markings, breeds, locomotion, and behavior."
              "\n \nHorses are adapted to run, as this trait allows them to quickly escape predators. They also possess an excellent sense of balance and a strong fight-or-flight response. Horses developed an unusual trait that is related to their need to be able to quickly flee from predators: they are able to sleep both standing up and lying down, with younger horses tending to sleep significantly more than adults.Female horses, called mares, carry their young for approximately 11 months, and a young horse, called a foal, can stand and run shortly following birth. Most domesticated horses begin training under a saddle or in a harness between the ages of two and four. They reach full adult development by age five, and they have an average lifespan between 25 and 30 years."
              "\n \n Classification of Horse"
              "\n\nKingdom:	Animalia"
              "\n\nPhylum:	Chordata"
              "\n\nClass:	Mammalia"
              "\n\nOrder:	Perissodactyla"
              "\n\nFamily:	Equidae"
              "\n\nGenus:	Equus"
              "\n\nSpecies:	E. ferus"
              "\n\nSubspecies:	E. f. caballus",
      "image": "assets/horse.jpg",
      "audio": "assets/horse.mp3",
      "class": "Equus caballus"
    },
    {
      "name": "Cow",
      "Description":
          "A cow is a domestic animal. Cows are one of the most innocent animals who are very harmless. People keep cows at their homes for various benefits. Cows are four-footed and have a large body. It has two horns, two eyes plus two ears and one nose and a mouth. Cows are herbivorous animals. They have a lot of uses to mankind. In fact, farmers and people keep cows at their homes for the same purposes."
              "\nThe most important thing is that cows give us milk. They are an essential source of milk for mankind. The milk given by cows helps us in staying healthy and strong. Milk has a lot of benefits which keeps various illnesses away. Moreover, it also enhances our immune system. The milk also produces a lot of products like butter, cream, curd, cheese and more."
              "\n \n Classification of Cow"
              "\n\nKingdom:	Animalia"
              "\n\nPhylum:	Chordata"
              "\n\nClass:	Mammalia"
              "\n\nOrder:	Artiodactyla"
              "\n\nFamily:	Bovidae"
              "\n\nSubfamily:	Bovinae"
              "\n\nGenus:	Bos"
              "Species:	B. taurus",
      "image": "assets/cow.jpg",
      "audio": "assets/cow.mp3",
      "class": "Bos taurus"
    },
    {
      "name": "Squireel",
      "Description":
          "Squirrels are generally small rodents with slender bodies, bushy tails and large eyes. In general, their fur is short, soft and silky, and ranges in thickness from species to species. The color of their fur is also highly variable and can be whitish, gray, yellow, red, brown, or even black."
              "\n It is often assumed that squirrels only eat nuts, but squirrels are actually omnivores, which means they like to eat plants and meat. Oftentimes squirrels rely on fungi, seeds, nuts and fruits for nutrition but they will also eat eggs, small insects, caterpillars, small animals and even young snakes. As their food source is highly variable with the weather, squirrels will prepare for colder months, when food is scarce, by burying their food."
              "\n \n Classification of Squirrel"
              "\n \nKingdom:	Animalia"
              "\n \nPhylum:	Chordata"
              "\n \nClass:	Mammalia"
              "\n \nOrder:	Rodentia"
              "\n \nSuborder:	Sciuromorpha"
              "\n \nFamily:	Sciuridae",
      "image": "assets/squirrel.jpg",
      "audio": "assets/squirrel.mp3",
      "class": "Sciuridae"
    },
    {
      "name": "Monkey",
      "Description":
          "Monkeys live all over the world and come in various shapes, sizes and colors. As one of our closest relatives, these mammals are very intelligent and have opposable thumbs, allowing them to use tools and play games."
              "\nThere are more than 260 different types of monkeys. They are separated into two major categories: New World and Old World."
              "\nThe New World monkeys live in the Americas, while Old World monkeys live in Asia and Africa. One difference between the two categories is that Old World monkeys don't have prehensile tails; New World monkeys do. Old World monkeys have special pouches in their cheek where they can store food. Old World monkeys have rump pads, but New World monkeys do not. Also, Old World monkeys' nostrils are small and curved and set close together; most New World monkeys have round nostrils set far apart."
              "\n \n Classification of Monkey"
              "\n\nKingdom:	Animalia"
              "\n \nPhylum:	Chordata"
              "\n \nClass:	Mammalia"
              "\n \nOrder:	Primates"
              "\n \nSuborder:	Haplorhini"
              "\n \nInfraorder:	Simiiformes",
      "image": "assets/monkey.jpg",
      "audio": "assets/monkey.mp3",
      "class": "Cercopithecidae"
    },
    {
      "name": "Elephant",
      "Description":
          "Elephants are the largest existing land animals. Three living species are currently recognised: the African bush elephant, the African forest elephant, and the Asian elephant. They are an informal grouping within the proboscidean family Elephantidae. Elephantidae is the only surviving family of proboscideans; extinct members include the mastodons. Elephantidae also contains several extinct groups, including the mammoths and straight-tusked elephants. African elephants have larger ears and concave backs, whereas Asian elephants have smaller ears, and convex or level backs. The distinctive features of all elephants include a long proboscis called a trunk, tusks, large ear flaps, massive legs, and tough but sensitive skin. The trunk is used for breathing, bringing food and water to the mouth, and grasping objects. Tusks, which are derived from the incisor teeth, serve both as weapons and as tools for moving objects and digging. The large ear flaps assist in maintaining a constant body temperature as well as in communication. The pillar-like legs carry their great weight."
              "\n Elephants are scattered throughout sub-Saharan Africa, South Asia, and Southeast Asia and are found in different habitats, including savannahs, forests, deserts, and marshes. They are herbivorous, and they stay near water when it is accessible. They are considered to be keystone species, due to their impact on their environments. Elephants have a fission–fusion society, in which multiple family groups come together to socialise."
              "\n \n Classification of Elephant"
              "\n\n Kingdom:	Animalia"
              "\n\nPhylum:	Chordata"
              "\n\nClass:	Mammalia"
              "\n\nOrder:	Proboscidea"
              "\n\nFamily:	Elephantidae"
              "Subfamily:	Elephantinae",
      "image": "assets/elephant.jpg",
      "audio": "assets/elephant.mp3",
      "class": "Loxodonta"
    }
  ];

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  static const oneSec = const Duration(seconds: 1);
  static const interval = const Duration(minutes: 1);

  Map<String, String> getValueDesc() {
    var descb;
    for (var i = 0; i < describe.length; i++) {
      if (describe[i]['name'] == widget.value) {
        descb = describe[i];
      }
    }
    return descb;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                foregroundDecoration: BoxDecoration(color: Colors.black26),
                height: 400,
                child: Image.asset((this.getValueDesc())['image'],
                    fit: BoxFit.cover)),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 26.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 250),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "${widget.value}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 16.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          (this.getValueDesc())['class'],
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.play_arrow),
                        onPressed: () {},
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.pause),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Colors.orange,
                            textColor: Colors.white,
                            child: Text(
                              "Play Sound",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 15.0,
                            ),
                            onPressed: () {
                              audioPlayer
                                  .open(Audio((this.getValueDesc())['audio']));
                              audioPlayer.play();
                              // print(describe);
                              // print(describe[0]['name']);

                              // describe.map((item) => {
                              //       {print(item['name'])}
                              //     });
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          "Description".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14.0),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          (this.getValueDesc())['Description'],
                          // "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
