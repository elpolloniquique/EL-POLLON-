# Guía 100% principiante — Conectar El Pollón con Supabase

Sigue esta guía **en orden**. No saltes pasos.  
Marca cada casilla cuando lo termines: `[ ]` → `[x]`

---

## ¿Qué vas a lograr?

Al terminar tendrás:

1. **Tienda** (`index.html`) → menú y pedidos guardados en la nube  
2. **Login admin** (`login.html`) → solo tú entras con correo y contraseña  
3. **Panel admin** (`admin.html`) → ver pedidos, productos, gráficos  

Todo usa **Supabase gratis** (no pagas nada en el plan Free).

---

# FASE 0 — Antes de empezar

## Lo que necesitas en tu computador

- [ ] Carpeta del proyecto: `EL-POLLON-`
- [ ] Editor: **Cursor** o VS Code (para editar `config.js`)
- [ ] Navegador: Chrome o Edge
- [ ] Cuenta en https://supabase.com (gratis)

## Archivos importantes (no los borres)

| Archivo | Para qué sirve |
|---------|----------------|
| `js/supabase/config.js` | Pega aquí URL y clave de Supabase |
| `supabase/schema-es.sql` | Crea las tablas |
| `supabase/storage.sql` | Carpeta de imágenes |
| `supabase/seed-productos-es.sql` | Carga los 59 platos |
| `supabase/crear-admin.sql` | Te da permiso de admin |

---

# FASE 1 — Proyecto en Supabase (15 min)

## Paso 1.1 — Entrar a Supabase

1. Abre https://supabase.com  
2. Clic en **Sign in** (inicia sesión con Google o correo)  
3. Verás el **Dashboard** (panel principal)

**✅ Listo si:** ves tus proyectos o un botón **New project**

---

## Paso 1.2 — Crear proyecto (si aún no lo tienes)

> Si ya tienes **el-pollon-db01**, salta al Paso 1.3.

1. Clic en **New project**  
2. **Organization:** deja la que te asigne (Free)  
3. **Name:** `el-pollon-db01`  
4. **Database password:** inventa una contraseña **fuerte** y **guárdala en un bloc de notas** (la pide Supabase para la base de datos, no es la del admin web)  
5. **Region:** elige la más cercana (ej. South America si aparece)  
6. Clic **Create new project**  
7. **Espera 2–3 minutos** hasta que deje de decir "Setting up..."

**✅ Listo si:** ves el menú izquierdo con Table Editor, SQL Editor, etc.

---

## Paso 1.3 — Anota el nombre de tu proyecto

Arriba verás algo como: `elpolloniquique's Org` / **el-pollon-db**

En la barra del navegador la URL será parecida a:

`https://supabase.com/dashboard/project/jhpfxxwudxyhldisxrro/...`

Ese código (`jhpfxxwudxyhldisxrro`) es tu **ID de proyecto** (el tuyo puede ser otro).

---

# FASE 2 — Copiar las claves a tu web (10 min)

## Paso 2.1 — Abrir API Settings

1. En el menú izquierdo, abajo: icono **⚙️ Project Settings**  
2. Clic en **API** (en el submenú)

Verás dos datos importantes:

| Nombre en Supabase | Qué es |
|------------------|--------|
| **Project URL** | Dirección de tu base de datos |
| **anon public** | Llave pública (segura para la web) |

⚠️ **NUNCA** copies la clave **service_role** en tu página web. Solo **anon public**.

---

## Paso 2.2 — Editar config.js en Cursor

1. Abre la carpeta `EL-POLLON-` en Cursor  
2. Abre el archivo: **`js/supabase/config.js`**  
3. Reemplaza **solo** estas líneas con tus datos reales:

```javascript
window.SUPABASE_CONFIG = {
  url: 'https://TU-ID.supabase.co',           // ← Project URL completa
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',  // ← anon public (toda la clave)
  adminEmail: 'TU-CORREO@gmail.com',        // ← el correo que usarás para entrar al admin
  legacyAdminPassword: 'HUILLCA123',
  storageBucket: 'product-images'
};
```

4. **Guardar:** `Ctrl + S`

**Ejemplo real (con datos inventados):**

```javascript
url: 'https://jhpfxxwudxyhldisxrro.supabase.co',
anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpocGZ4eHd1ZHh5aGxkaXN4cnJvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY...',
adminEmail: 'polloniquique@gmail.com',
```

**✅ Listo si:** no quedan los textos `TU_SUPABASE_URL` ni `TU_SUPABASE_ANON_KEY`

---

# FASE 3 — Crear tablas en la base de datos (20 min)

## Paso 3.1 — Abrir SQL Editor

1. Menú izquierdo → **SQL Editor**  
2. Clic en **+ New query**

---

## Paso 3.2 — Ejecutar schema-es.sql (TABLAS)

1. En Cursor, abre: **`supabase/schema-es.sql`**  
2. Selecciona **TODO** el archivo: `Ctrl + A` → `Ctrl + C`  
3. En Supabase SQL Editor, pega: `Ctrl + V`  
4. Abajo a la derecha: botón verde **Run** (o `Ctrl + Enter`)  
5. Espera el mensaje **Success** (éxito)

**Si sale error:** copia el mensaje rojo y guárdalo (puede ser que una tabla ya exista; a veces es normal).

**✅ Listo si:** en **Table Editor** ves tablas nuevas:
- `categorias`
- `productos`
- `pedidos`
- `detalle_pedidos`
- `administradores`
- `configuracion_tienda`

> La tabla `productos` que creaste a mano antes puede quedar; la importante es la del schema con columnas como `categoria_id`, `imagen_url`, etc.

---

## Paso 3.3 — Ejecutar storage.sql (IMÁGENES)

1. **New query** otra vez  
2. Abre **`supabase/storage.sql`** en Cursor → copia todo → pega → **Run**  
3. Debe decir **Success**

**✅ Listo si:** menú **Storage** → ves bucket **`product-images`**

---

## Paso 3.4 — Ejecutar seed-productos-es.sql (MENÚ COMPLETO)

1. **New query**  
2. Abre **`supabase/seed-productos-es.sql`** (archivo largo, ~59 productos)  
3. Copia todo → pega → **Run**  
4. Puede tardar unos segundos

**✅ Listo si:** **Table Editor** → tabla **`productos`** → muchas filas (decenas de platos)

**Table Editor** → **`categorias`** → 7 filas (Ofertas Familiares, Bebidas, etc.)

---

# FASE 4 — Usuario administrador (15 min)

## Paso 4.1 — Crear usuario en Authentication

1. Menú izquierdo → **Authentication**  
2. Pestaña **Users**  
3. Clic **Add user** → **Create new user**  
4. **Email:** el **mismo** que pusiste en `adminEmail` en config.js  
5. **Password:** inventa una contraseña (ej. `Pollon2025!`) — **anótala**  
6. Deja marcado **Auto Confirm User** si aparece  
7. Clic **Create user**

**✅ Listo si:** el usuario aparece en la lista con estado confirmado

---

## Paso 4.2 — Dar permiso de administrador (SQL)

1. **SQL Editor** → **New query**  
2. Abre **`supabase/crear-admin.sql`**  
3. **Cambia** el email en la última línea si tu correo es otro:

```sql
WHERE email = 'TU-CORREO@gmail.com'
```

4. Copia todo el archivo → pega → **Run**

**✅ Listo si:** **Table Editor** → **`administradores`** → 1 fila con tu correo y rol `super_admin`

---

# FASE 5 — Tiempo real de pedidos (5 min)

## Paso 5.1 — Activar Realtime

1. Menú **Database**  
2. Busca **Replication** o en versiones nuevas: **Publications** / Realtime en tabla  
3. Activa la tabla **`pedidos`** para realtime  

(Si no encuentras Replication: en muchos proyectos `schema-es.sql` ya lo configuró; puedes continuar.)

**✅ Listo si:** pedidos nuevos aparecen en el admin sin recargar (lo probamos en Fase 7)

---

# FASE 6 — Subir tu web y probar localmente (10 min)

## Opción A — Abrir directo en el navegador

1. Ve a la carpeta `EL-POLLON-` en el Explorador de Windows  
2. Doble clic en **`index.html`**  

⚠️ A veces Supabase falla si abres así. Mejor Opción B.

## Opción B — Con extensión Live Server (recomendado)

1. En Cursor/VS Code instala extensión **Live Server**  
2. Clic derecho en `index.html` → **Open with Live Server**  
3. Se abre `http://127.0.0.1:5500/...`

## Opción C — GitHub Pages (tu sitio público)

1. Sube los cambios a GitHub  
2. Espera 1–2 min  
3. Abre: https://elpolloniquique.github.io/EL-POLLON-/

---

# FASE 7 — Pruebas finales (checklist 100%)

## Prueba 1 — Tienda

- [ ] Abre `index.html` (o tu URL de GitHub)  
- [ ] Presiona **F12** → pestaña **Console**  
- [ ] Debe decir: `[Pollón] Menú cargado desde Supabase` (o similar)  
- [ ] Ves los productos en el menú  
- [ ] Agregas algo al carrito → **Realizar pedido** → completa datos → envía  

**✅ En Supabase:** Table Editor → **`pedidos`** → aparece 1 fila nueva

---

## Prueba 2 — Login admin

- [ ] Abre **`login.html`**  
- [ ] Correo: el de `adminEmail`  
- [ ] Contraseña: la que creaste en Authentication  
- [ ] Debe entrar a **`admin.html`**

Si falla: prueba contraseña legacy `HUILLCA123` (modo respaldo sin Supabase Auth)

---

## Prueba 3 — Panel admin

- [ ] Dashboard muestra números (pedidos, ventas)  
- [ ] Sección **Pedidos** → ves el pedido de prueba  
- [ ] Clic **Estado** → cambia el estado  
- [ ] Clic **🖨️** → imprime ticket  
- [ ] Sección **Productos** → ves la lista  
- [ ] **+ Nuevo producto** → puedes crear uno de prueba  

---

# FASE 8 — Subir a GitHub (para que quede online)

1. Abre terminal en la carpeta del proyecto  
2. Ejecuta:

```bash
git add .
git commit -m "Conectar Supabase y panel admin"
git push
```

3. Espera y abre: https://elpolloniquique.github.io/EL-POLLON-/

**Importante:** `config.js` con tus claves quedará en GitHub. Para un negocio real conviene usar variables de entorno; en plan gratuito y repo privado está aceptable para empezar.

---

# Errores comunes

| Problema | Solución |
|----------|----------|
| Menú vacío o solo local | Revisa `config.js` — URL y anonKey correctos, sin espacios |
| "Invalid API key" | Copiaste mal la anon key; vuelve a Settings → API |
| Login admin no entra | Usuario en Authentication + fila en `administradores` |
| Error al Run SQL | Copia el error; a veces hay que borrar tabla vieja manual |
| Pedido no se guarda | Ejecutaste `schema-es.sql` y existe tabla `pedidos` |
| CORS / failed to fetch | Usa Live Server o GitHub Pages, no archivo `file://` |

---

# Envíame capturas en estos puntos

Para ayudarte sin perderte, manda screenshot cuando termines:

1. **Paso 2** — Pantalla API con URL (puedes tapar parte de la clave)  
2. **Paso 3.2** — Resultado después de Run schema-es  
3. **Paso 3.4** — Table Editor con tabla `productos` llena  
4. **Paso 4** — Authentication con tu usuario  
5. **Paso 7** — Console del navegador (F12) en index.html  

Con eso te digo exactamente el siguiente clic si algo falla.

---

# Resumen en una línea por fase

1. Crear proyecto Supabase  
2. Pegar URL + anon en `config.js`  
3. Run: schema-es → storage → seed-productos-es  
4. Crear usuario Auth + run crear-admin.sql  
5. Activar realtime en pedidos  
6. Abrir index.html y login.html  
7. Probar carrito + admin  
8. Push a GitHub  

**¡Tu proyecto al 100% cuando las 3 pruebas de la Fase 7 estén marcadas!**
