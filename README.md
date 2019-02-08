# Pokédex
Aplicação iOS desenvolvida em Swift com arquitetura Model View Controller utilizando a [PokéAPI](https://pokeapi.co/) - "The RESTful Pokémon API".

![](https://scontent.fpoa11-1.fna.fbcdn.net/v/t1.15752-9/51777795_606866689775220_5779215243678842880_n.png?_nc_cat=109&_nc_ht=scontent.fpoa11-1.fna&oh=f431d1eb452623c86ac318af747a8219&oe=5CB720A0)  |  ![](https://scontent.fpoa11-1.fna.fbcdn.net/v/t1.15752-9/51654161_389004765236395_1040939015571767296_n.png?_nc_cat=100&_nc_ht=scontent.fpoa11-1.fna&oh=68c56fc3a3aefefda656214499c40f05&oe=5CEF911B) | ![](https://scontent.fpoa11-1.fna.fbcdn.net/v/t1.15752-9/51532680_803621266639421_7841399694424014848_n.png?_nc_cat=103&_nc_ht=scontent.fpoa11-1.fna&oh=34b30221d355a56bd9afb5df95636427&oe=5CED8C47)  |
:-:|:-:|:-:
![](https://scontent.fpoa11-1.fna.fbcdn.net/v/t1.15752-9/51511137_1109707672542005_6677383855499902976_n.png?_nc_cat=106&_nc_ht=scontent.fpoa11-1.fna&oh=694734bb70cb7629a0dd1eab2b6f99b6&oe=5CB493DC)  |  ![](https://scontent.fpoa11-1.fna.fbcdn.net/v/t1.15752-9/52188114_1896431413818507_5507249066863493120_n.png?_nc_cat=107&_nc_ht=scontent.fpoa11-1.fna&oh=87bee6b326f0874a8fe85e078a43b883&oe=5CE0DC8F) | ![](https://scontent.fpoa11-1.fna.fbcdn.net/v/t1.15752-9/51344572_389744118254980_6961486935583883264_n.png?_nc_cat=100&_nc_ht=scontent.fpoa11-1.fna&oh=1e6a0eab55c8622b76d80064946a7009&oe=5CF29F2D) |

## Arquitetura MVC
A ideia inicial era construir a aplicação em MVVM (Model View View-Model) mas MVC pareceu mais adequado pelas varias visualizações dos mesmos dados resgatados da PokéAPI.

## Construído com
* [Alamofire](https://github.com/Alamofire/Alamofire) - "Elegant HTTP Networking in Swift"
	* Utilizado para ajudar nas requisições da api, tratando a resposta de forma elegante e ajudando na atualização dos componentes de UI.

* [Kingfisher](https://github.com/onevcat/Kingfisher) - "A lightweight, pure-Swift library for downloading and caching images from the web."
	* Biblioteca utilizada para fazer download das imagens dos pokémons e manter em cache. (Biblioteca 100% em Swift)

* [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) - "The better way to deal with JSON data in Swift."
	* Facilita na hora de lidar o JSON retornado pelas requisições da api. Swift tem por padrão uma maneira de tratar JSON, mas é complicada e bastante "suja", essa biblitoeca ajuda a deixar o código mais limpo e legível.

* [SwiftOverlays](https://github.com/peterprokop/SwiftOverlays) - "SwiftOverlays is a Swift GUI library for displaying various popups and notifications"
	* Utilizada apenas para mostrar popup de carregamento enquanto uma requisição é completada.