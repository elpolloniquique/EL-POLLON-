# Guía paso a paso: publicar El Pollón en Google (principiantes)

Tu sitio público es:

**https://elpolloniquique.github.io/El-Pollon-Iquique_Delivery-/**

Esta guía explica cómo hacer que Google **encuentre, indexe y muestre** tu página cuando alguien busque, por ejemplo:

- pollería iquique  
- pollo a la brasa iquique  
- delivery iquique  
- el pollón iquique  
- pedir pollo iquique  

> **Importante:** Aparecer en Google no es instantáneo. Suele tardar **unos días o 2–4 semanas** la primera vez. Después, cuando actualices el sitio, Google se actualiza más rápido.

---

## Parte 1 — Qué ya está configurado en tu proyecto

En la carpeta del proyecto ya tienes listo lo que Google necesita:

| Archivo | Para qué sirve |
|---------|----------------|
| `index.html` | Título, descripción, palabras clave, Open Graph, verificación de Google, datos estructurados (Schema.org) |
| `robots.txt` | Indica a Google qué puede rastrear (página principal sí; admin y login no) |
| `sitemap.xml` | Mapa del sitio para que Google encuentre tu URL principal |
| `google8bdf3d69cfe1eb83.html` | Archivo alternativo de verificación en Search Console |
| `.nojekyll` | Evita que GitHub Pages bloquee archivos que empiezan con `_` |

**URLs corregidas:** Todo apunta a `El-Pollon-Iquique_Delivery-` (la misma URL que ves en el navegador), no a rutas antiguas.

---

## Parte 2 — Subir los cambios a GitHub (obligatorio)

Si no subes los archivos a GitHub, Google seguirá viendo la versión antigua.

### Paso 2.1 — Abrir terminal en la carpeta del proyecto

1. En Cursor o VS Code, abre la carpeta `EL-POLLON-`.
2. Abre la terminal integrada (menú **Terminal → Nueva terminal**).

### Paso 2.2 — Ver qué cambió

```powershell
cd "c:\PAGINAS WEB DE POLLON EN GIT\PAGINA WEB_DB_SUPABASE\EL-POLLON-"
git status
```

Deberías ver archivos como `index.html`, `robots.txt`, `sitemap.xml`, `GUIA-INDEXAR-EN-GOOGLE.md`, etc.

### Paso 2.3 — Guardar y enviar a GitHub

```powershell
git add index.html robots.txt sitemap.xml login.html .nojekyll GUIA-INDEXAR-EN-GOOGLE.md google8bdf3d69cfe1eb83.html
git commit -m "SEO: URLs correctas, sitemap y guía para indexar en Google"
git push origin main
```

Si tu rama se llama `master` en lugar de `main`, usa:

```powershell
git push origin master
```

### Paso 2.4 — Esperar a GitHub Pages (1–3 minutos)

1. Entra a tu repositorio en GitHub (usuario `elpolloniquique`).
2. Ve a **Settings → Pages**.
3. Confirma que **Source** esté en **Deploy from branch** y rama `main` (o `master`), carpeta `/ (root)`.
4. La URL debe ser la del sitio: `https://elpolloniquique.github.io/El-Pollon-Iquique_Delivery-/`

### Paso 2.5 — Comprobar que los archivos SEO existen en internet

Abre en el navegador (deben cargar sin error 404):

- https://elpolloniquique.github.io/El-Pollon-Iquique_Delivery-/robots.txt  
- https://elpolloniquique.github.io/El-Pollon-Iquique_Delivery-/sitemap.xml  
- https://elpolloniquique.github.io/El-Pollon-Iquique_Delivery-/google8bdf3d69cfe1eb83.html  

---

## Parte 3 — Google Search Console (verificar el sitio)

Search Console es la herramienta **gratuita** de Google para decirle: “este sitio es mío, por favor indexa mis páginas”.

### Paso 3.1 — Crear cuenta e ingresar

1. Abre: **https://search.google.com/search-console**  
2. Inicia sesión con tu cuenta de Google (Gmail).
3. Si es la primera vez, acepta los términos.

### Paso 3.2 — Agregar tu propiedad (sitio web)

1. Clic en **“Agregar propiedad”** (o el menú desplegable de propiedades).
2. Elige el tipo **Prefijo de URL** (no “Dominio”, porque GitHub Pages usa una subruta).
3. Escribe **exactamente** (copiar y pegar):

   ```
   https://elpolloniquique.github.io/El-Pollon-Iquique_Delivery-/
   ```

4. Clic en **Continuar**.

### Paso 3.3 — Verificar que el sitio es tuyo

Google te mostrará varios métodos. Tu proyecto ya tiene **dos** preparados:

#### Método A — Etiqueta HTML (recomendado)

1. En Search Console elige **Etiqueta HTML**.
2. Verás algo como:  
   `meta name="google-site-verification" content="XXXXX"`
3. En tu `index.html` **ya está** esta línea (no necesitas cambiarla si coincide con la que te muestra Google).
4. Si Google te da un código **nuevo y distinto**, avísale a quien te ayuda a editar `index.html` o reemplázalo tú en la línea 5 del `<head>`, sube a GitHub y espera 2 minutos.
5. En Search Console clic en **Verificar**.

#### Método B — Archivo HTML

1. Elige **Archivo HTML**.
2. Google pedirá un archivo como `googleXXXXXXXX.html`.
3. Tu proyecto ya incluye `google8bdf3d69cfe1eb83.html`.
4. Comprueba que abra en:  
   https://elpolloniquique.github.io/El-Pollon-Iquique_Delivery-/google8bdf3d69cfe1eb83.html  
5. Clic en **Verificar**.

Si falla la verificación:

- Espera 5–10 minutos tras el `git push`.
- Borra caché del navegador o prueba en ventana de incógnito.
- Confirma que la URL en Search Console sea **idéntica** a la del navegador (con `/` final).

---

## Parte 4 — Enviar el sitemap a Google

1. En Search Console, menú izquierdo: **Sitemaps** (o “Mapas del sitio”).
2. En “Agregar un sitemap nuevo”, escribe solo:

   ```
   sitemap.xml
   ```

   (No pongas la URL completa otra vez; Search Console ya usa tu prefijo.)

3. Clic en **Enviar**.
4. Estado debe pasar a **Correcto** en unas horas (a veces minutos).

---

## Parte 5 — Pedir indexación de la página principal (más rápido)

1. Menú izquierdo: **Inspección de URLs**.
2. Pega:

   ```
   https://elpolloniquique.github.io/El-Pollon-Iquique_Delivery-/
   ```

3. Enter y espera el análisis.
4. Si dice “La URL no está en Google”, clic en **Solicitar indexación**.
5. Repite después de cada cambio grande al menú o textos importantes.

---

## Parte 6 — Google Business Profile (búsquedas locales, muy recomendado)

Para que aparezcas en **Google Maps** y búsquedas tipo “pollería cerca de mí”:

1. Entra a: **https://business.google.com**  
2. Crea o reclama el perfil de **Pollería El Pollón**.
3. Datos que debes poner (iguales que tu web):
   - Nombre: Pollería El Pollón  
   - Dirección: Calle Vivar 1086, Iquique  
   - Teléfono: +56 9 8692 5310  
   - Horario: Lun–Dom 11:30 – 23:00  
   - Categoría: Restaurante / Pollería  
   - Sitio web: `https://elpolloniquique.github.io/El-Pollon-Iquique_Delivery-/`
4. Sube fotos del local, platos y logo.
5. Pide reseñas a clientes satisfechos (ayuda mucho al posicionamiento local).

---

## Parte 7 — Cómo saber si ya apareces en Google

### Prueba 1 — Búsqueda con el nombre del sitio

En Google busca:

```
site:elpolloniquique.github.io El Pollón
```

Si sale tu página, Google ya la tiene indexada.

### Prueba 2 — Búsquedas que haría un cliente

Prueba (puede tardar semanas en posicionarse bien):

- `pollería el pollón iquique`  
- `el pollón iquique delivery`  
- `pollo a la brasa delivery iquique`  

### Prueba 3 — Search Console

Menú **Rendimiento** → verás clics e impresiones cuando empiece el tráfico desde búsqueda.

---

## Parte 8 — Mantenimiento (cada vez que actualices el sitio)

1. `git add` → `git commit` → `git push`  
2. Espera 2–5 minutos.  
3. En Search Console → **Inspección de URLs** → **Solicitar indexación** de la home.  

No hace falta volver a verificar el sitio cada vez; solo la primera vez.

---

## Parte 9 — Errores frecuentes y solución

| Problema | Solución |
|----------|----------|
| Search Console no verifica | URL exacta con `El-Pollon-Iquique_Delivery-`; esperar tras `git push` |
| `robots.txt` da 404 | El repositorio en GitHub debe llamarse igual que la URL de Pages |
| Aparece `EL-POLLON` en vez de `El-Pollon-Iquique_Delivery-` | Ya corregido en `index.html`; vuelve a subir a GitHub |
| Admin o login en Google | `robots.txt` y `noindex` en `admin.html` / `login.html` los ocultan |
| Tardo mucho en aparecer | Normal 3–14 días; usa Business Profile y solicita indexación |
| Quiero dominio propio (`www.elpollon.cl`) | Comprar dominio, enlazar en GitHub Pages Settings → Custom domain y repetir verificación en Search Console con la URL nueva |

---

## Resumen rápido (checklist)

- [ ] Subir cambios a GitHub (`git push`)  
- [ ] Comprobar `robots.txt` y `sitemap.xml` en el navegador  
- [ ] Crear propiedad en Search Console con la URL correcta  
- [ ] Verificar (etiqueta HTML o archivo `google….html`)  
- [ ] Enviar sitemap: `sitemap.xml`  
- [ ] Solicitar indexación de la página principal  
- [ ] Crear perfil en Google Business Profile  
- [ ] Esperar y revisar con `site:elpolloniquique.github.io`  

---

## Enlaces útiles

- Tu sitio: https://elpolloniquique.github.io/El-Pollon-Iquique_Delivery-/  
- Google Search Console: https://search.google.com/search-console  
- Google Business: https://business.google.com  
- Documentación GitHub Pages: https://docs.github.com/es/pages  

Si necesitas ayuda con un paso concreto (captura de pantalla de un error en Search Console), guarda el mensaje exacto que muestra Google y revísalo con esta guía en la Parte 9.
