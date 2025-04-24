# 🚌 Bus Tracker – Prueba de Concepto

**Bus Tracker** es una aplicación móvil desarrollada en Flutter que permite visualizar rutas de buses y hacer seguimiento en tiempo real de la ubicación del chofer sobre un mapa interactivo. Esta versión es una prueba de concepto, sin embargo con la tecnología aplicada en esta demo, se busca sustentar posteriormente a tres aplicaciones, una destinada a choferes de buses rurales que compartan la ubicación del bus en tiempo real y como transitan una ruta definida, luego desde una app movil de cliente, los usuarios de buses rurales podrán consultar la ubicación en tiempo real del bus, por último se busca dotar a los administradores de empresas de buses de una aplicación que permita tener control de su flota.

## 🧭 Funcionalidades

- 📍 Obtención de ubicación en tiempo real usando GPS.
- 🗺️ Mapa interactivo basado en OpenStreetMap (a través de `flutter_map`).
- 🧵 Visualización de rutas predefinidas (desde archivos GeoJSON).
- 🔄 Seguimiento animado con centrado suave del mapa.
- 🔙 Navegación entre selección de rutas y mapa.
- ✅ Arquitectura clara y escalable basada en MVC.

## 📸 Capturas

![WhatsApp Image 2025-04-23 at 23 33 17](https://github.com/user-attachments/assets/a3722e4c-cd90-4fa7-8937-182d1ac7097e)
![WhatsApp Image 2025-04-23 at 23 19 18](https://github.com/user-attachments/assets/0aa59290-bef1-4e88-9b84-eb19222f09b8)



## 🛠️ Tecnologías utilizadas

- [Flutter](https://flutter.dev/)
- [flutter_map](https://pub.dev/packages/flutter_map) (v8.1.1)
- [latlong2](https://pub.dev/packages/latlong2) (v0.9.0)
- [geolocator](https://pub.dev/packages/geolocator) (v10.1.0)
- [provider](https://pub.dev/packages/provider) (v6.0.0)

## 🧱 Estructura del proyecto

lib/  
├── controllers/  
│ ├── location_controller.dart  
│ └── route_controller.dart  
├── models/  
│ └── route_model.dart  
├── services/  
│ └── route_service.dart  
├── views/  
│ ├── map_screen.dart  
│ └── route_selection_screen.dart  
├── widgets/  
│ └── location_marker.dart  
├── main.dart  
├── assets/  
| └── routes/  
|   ├── MB72_A_To_SanJose.json  
|   └── MB72_B_Return.json  


## ▶️ Cómo correr la app

1. Clona el repositorio:

   ```bash
   git clone https://github.com/Diego11879/bus_tracker_front.git
   cd bus_tracker
   ```
2. Instala Dependencias
   ```bash
   flutter pub get
   ```
3. Ejecuta la Aplicación
   ```bash
   flutter run
   ```

## 🚧 Posibles mejoras futuras

- Visualización de múltiples buses en tiempo real.

- Backend con API Python + Flask para monitoreo de flota.

- Guardado de rutas favoritas.

- Notificaciones cuando un bus esté cerca.

- Modo oscuro y temas visuales.

## 👨‍💻 Autores

Diego Vilches  
Nicolás Toledo

