<p align="center">
  <img src="assets/icons/icon Copy.png" width="120" alt="Analyzer Logo"/>
</p>

<h1 align="center">NX Analyzer</h1>

<p align="center">
  <b>Analizador de perfiles públicos de Roblox</b><br>
  Script Luau con UI premium, múltiples temas y validación de datos en tiempo real.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-3.9.3-blueviolet?style=flat-square" alt="version"/>
  <img src="https://img.shields.io/badge/lenguaje-Luau-blue?style=flat-square" alt="luau"/>
  <img src="https://img.shields.io/badge/licencia-Proprietary-red?style=flat-square" alt="license"/>
</p>

---

## ¿Qué es?

NX Analyzer es un script de Luau que analiza perfiles públicos de Roblox desde el cliente. Recopila información pública (amigos, seguidores, grupos, badges, juegos creados, avatar, etc.) y la presenta en una interfaz visual con animaciones, sistema de puntuación de riesgo y validación de integridad de datos.

## Características

- **Análisis de perfil completo** — ID, username, display name, fecha de creación, edad de cuenta, descripción, suscripción Premium y más.
- **Puntuación de riesgo** — Evalúa el perfil con un score basado en antigüedad, actividad, amigos, badges y otros factores.
- **NX Shields (Validación de datos)** — Sistema de integridad que verifica cada dato recibido de la API. Detecta respuestas corruptas, vacías o manipuladas.
- **NX Intel** — Historial de usernames e inteligencia sobre cambios de nombre, con persistencia local.
- **NX Head Tags** — Tags visuales sobre los jugadores en el servidor.
- **NX Scan** — Animación identitaria de escaneo con 3 nodos que corre al iniciar un análisis.
- **Username Decoder** — Análisis del patrón del nombre de usuario.
- **Sistema de banneo** — Blocklist remota (`banned.json`) con verificación de amigos en común.
- **8 temas visuales** — Negro, Azul, Verde, Tor, Rojo, Morado, Cyan y Rosa. Cambio en vivo sin recargar.
- **Persistencia local** — Guarda preferencias (tema, animaciones, head tags) en archivo JSON con backup automático.
- **Animaciones premium** — Smoosh drag, fade escalonado de tarjetas (stagger), transiciones entre tabs, hover con UIStroke animado. Toggle global para desactivarlas.
- **Panel de administración** — Configuraciones avanzadas y toggles internos.

## Estructura

```
├── ANALYZER.lua        # Script principal (~13.6K líneas)
├── banned.json         # Blocklist de IDs baneados
├── assets/
│   └── icons/          # Iconos de la UI (PNG)
└── LICENSE             # All Rights Reserved
```

## Temas disponibles

| Tema | Acento |
|------|--------|
| Negro | Gris claro |
| Azul | Azul Discord |
| Verde | Verde esmeralda |
| Tor | Morado oscuro (default) |
| Rojo | Rojo intenso |
| Morado | Violeta |
| Cyan | Turquesa |
| Rosa | Rosa neón |

## Requisitos

- Roblox con un executor que soporte Luau.
- Funciones opcionales del executor: `writefile`, `readfile`, `isfile` (para persistencia), `getsynasset`/`getcustomasset` (para iconos).

## Uso

1. Copia el contenido de `ANALYZER.lua` en tu executor.
2. Ejecuta el script dentro de una partida de Roblox.
3. Ingresa el username o ID del perfil a analizar.
4. Revisa los resultados en las pestañas: **Perfil**, **Análisis** y **Admin**.

## Licencia

Este proyecto está bajo licencia propietaria. Todos los derechos reservados. Ver [LICENSE](LICENSE) para más detalles.

---

<p align="center">
  Desarrollado por <a href="https://github.com/dreennx"><b>dreennx</b></a>
</p>
