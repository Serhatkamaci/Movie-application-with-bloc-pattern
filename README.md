Bu çalışmada, Bloc mimarisini kullanarak Flutter'da bir film uygulaması geliştirdim. Film verilerini Firebase Console üzerinde oluşturduğum veritabanından alıyorum. Pubspec.yaml dosyasına eklediğim paketler şunlardır: firebase_core, firebase_database ve flutter_bloc. Ayrıca, filmlere ait resimleri içeren bir klasörü "images" adlı klasör içinde ekledim.
Uygulamamda flutter_bloc paketini kullanmamın sebebi, Bloc mimarisi ile tasarım yapmaktır. Firebase_core ve firebase_database paketlerini ise Firebase veritabanı ile Android uygulama arasındaki bağlantıları sağlamak ve veritabanında insert, update, delete ve select gibi işlemleri gerçekleştirmek için kullandım.
Main.dart dosyasını çalıştırdığınızda, uygulamanın ana sayfası olan Kategoriler sayfası ile karşılaşacaksınız. Bu sayfa, Firebase veritabanında bulunan film kategorilerini içermektedir. Ayrıca, appBar üzerinde bulunan arama ikonu ile arama yapabilirsiniz. Kategorilere ait card widget'ına tıkladığınızda, o kategorilere ait filmler sayfasına geçiş yapacaksınız. Bu sayfada bulunan filmlerden birine tıkladığınızda ise o filme ait yönetmen ve yıl bilgilerini göreceksiniz.
Dinlediğiniz için teşekkür ederim.

--------------------------------------------------

In this study, I developed a movie application in Flutter using the Bloc architecture. I get movie data from the database I created on the Firebase Console. The packages I added to the pubspec.yaml file are: firebase_core, firebase_database, and flutter_bloc. I also added a folder containing images of movies in the "images" folder.
The reason I used the flutter_bloc package in my application is to design with the Bloc architecture. I used the firebase_core and firebase_database packages to provide connections between the Firebase database and the Android application and to perform operations such as insert, update, delete, and select in the database.
When you run the Main.dart file, you will see the Categories page, which is the main page of the application. This page contains movie categories in the Firebase database. You can also search with the search icon on the appBar. When you click on the card widget of the categories, you will go to the movies page of that category. When you click on one of the movies on this page, you will see the director and year information of that movie.
Thank you for listening.
