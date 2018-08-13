PGDMP                         v            tokendb    9.4.10    10.0      �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16385    tokendb    DATABASE     e   CREATE DATABASE tokendb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE tokendb;
             token    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    11855    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16433    id_task_data_seq    SEQUENCE     r   CREATE SEQUENCE id_task_data_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_task_data_seq;
       public       token    false    6            �            1259    16422    id_task_history_seq    SEQUENCE     u   CREATE SEQUENCE id_task_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.id_task_history_seq;
       public       token    false    6            �            1259    16419    id_wallets_seq    SEQUENCE     p   CREATE SEQUENCE id_wallets_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.id_wallets_seq;
       public       token    false    6            �            1259    16425 	   task_data    TABLE     �   CREATE TABLE task_data (
    id_task_data integer DEFAULT nextval('id_task_data_seq'::regclass) NOT NULL,
    from_csv character varying(20000),
    id_task character varying(50),
    put_date date
);
    DROP TABLE public.task_data;
       public         token    false    181    6            �            1259    16406    task_history    TABLE     �   CREATE TABLE task_history (
    id_task_history integer DEFAULT nextval('id_task_history_seq'::regclass) NOT NULL,
    name_task character varying(40),
    status character varying,
    wallet_id integer,
    start_date date,
    end_date date
);
     DROP TABLE public.task_history;
       public         token    false    179    6            �            1259    16403    transfer_history_id_seq    SEQUENCE     y   CREATE SEQUENCE transfer_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.transfer_history_id_seq;
       public       token    false    6            �            1259    16394    transfer_history    TABLE       CREATE TABLE transfer_history (
    id integer DEFAULT nextval('transfer_history_id_seq'::regclass) NOT NULL,
    sended_tokens numeric,
    number_time integer,
    task_id character varying(20),
    time_transfer date,
    sended_addresses character varying(2048)
);
 $   DROP TABLE public.transfer_history;
       public         token    false    175    6            �            1259    16386    users    TABLE     H   CREATE TABLE users (
    name character varying(30),
    age numeric
);
    DROP TABLE public.users;
       public         postgres    false    6            �           0    0    users    ACL     �   REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM postgres;
GRANT ALL ON TABLE users TO postgres;
GRANT ALL ON TABLE users TO token;
            public       postgres    false    173            �            1259    16414    wallets    TABLE     �   CREATE TABLE wallets (
    id_wallets integer DEFAULT nextval('id_wallets_seq'::regclass) NOT NULL,
    address character varying(20),
    private_key character varying(50)
);
    DROP TABLE public.wallets;
       public         token    false    178    6            �          0    16425 	   task_data 
   TABLE DATA                     public       token    false    180   �       �          0    16406    task_history 
   TABLE DATA                     public       token    false    176          �          0    16394    transfer_history 
   TABLE DATA                     public       token    false    174   7       �          0    16386    users 
   TABLE DATA                     public       postgres    false    173   �       �          0    16414    wallets 
   TABLE DATA                     public       token    false    177   (        �           0    0    id_task_data_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('id_task_data_seq', 2, true);
            public       token    false    181                        0    0    id_task_history_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('id_task_history_seq', 2, true);
            public       token    false    179                       0    0    id_wallets_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('id_wallets_seq', 2, true);
            public       token    false    178                       0    0    transfer_history_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('transfer_history_id_seq', 2, true);
            public       token    false    175                       2606    16432    task_data task_data_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY task_data
    ADD CONSTRAINT task_data_pkey PRIMARY KEY (id_task_data);
 B   ALTER TABLE ONLY public.task_data DROP CONSTRAINT task_data_pkey;
       public         token    false    180            {           2606    16413    task_history task_history_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY task_history
    ADD CONSTRAINT task_history_pkey PRIMARY KEY (id_task_history);
 H   ALTER TABLE ONLY public.task_history DROP CONSTRAINT task_history_pkey;
       public         token    false    176            y           2606    16401 &   transfer_history transfer_history_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY transfer_history
    ADD CONSTRAINT transfer_history_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.transfer_history DROP CONSTRAINT transfer_history_pkey;
       public         token    false    174            }           2606    16418    wallets wallets_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id_wallets);
 >   ALTER TABLE ONLY public.wallets DROP CONSTRAINT wallets_pkey;
       public         token    false    177            w           1259    16402    id    INDEX     =   CREATE UNIQUE INDEX id ON transfer_history USING btree (id);
    DROP INDEX public.id;
       public         token    false    174            �   �   x���v
Q���W(I,ΎOI,IT��L���tҊ�s㓋�t��:
�% �TM�0G�P�`#�����0�QR02P�թ.N�A��1P�V��8�89�8;'�8G��8�8%�$ld`h�k`�kh��i��� �n2C      �   
   x���          �   �   x���v
Q���W()J�+NK-���,.�/�T��L�Q(N�KIM�/��N�+�Q�+�M*)��M�Q(I,Ύ)q�a��zSR�R��S�5�}B]�4u�MtL��/���Դ��k�t����c�� �]      �   K   x���v
Q���W(-N-*V��K�M�QHLO�Ts�	uV�P����S�Q02Դ��$NKYbqe"P��1P Mp)      �   
   x���         