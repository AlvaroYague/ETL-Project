import folium
import unicodedata
def mostrar_viviendas_filtradas(df, columnas, filtro_barrio=None, precio_min=None, precio_max=None):
 
    mapa = folium.Map(location=[40.4167, -3.70325], zoom_start=12)
    
    for index, row in df.iterrows():
        if (
            (filtro_barrio is None or row['Distrito'].lower() == filtro_barrio.lower()) and
            (precio_min is None or row['Precio'] >= precio_min) and
            (precio_max is None or row['Precio'] <= precio_max)
        ):
            info = ", ".join([f"{col}: {row[col]}" for col in columnas])
            folium.Marker(
                location=[row['Latitud'], row['Longitud']],
                popup=info
            ).add_to(mapa)

    return mapa



def quitar_tildes_y_simbolos(texto):
    texto = unicodedata.normalize('NFKD', texto).encode('ASCII', 'ignore').decode('utf-8')
    texto = ''.join(e for e in texto if (e.isalnum() or e.isspace()))
    return texto