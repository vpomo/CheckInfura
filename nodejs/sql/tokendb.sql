PGDMP     .                     v            tokendb    9.5.14    10.4 !    `           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            a           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            b           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            c           1262    16385    tokendb    DATABASE     �   CREATE DATABASE tokendb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE tokendb;
             token    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            d           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            e           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    12355    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            f           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16389    id_task_data_seq    SEQUENCE     y   CREATE SEQUENCE public.id_task_data_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_task_data_seq;
       public       token    false    7            �            1259    16391    id_task_history_seq    SEQUENCE     |   CREATE SEQUENCE public.id_task_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.id_task_history_seq;
       public       token    false    7            �            1259    16393    id_wallets_seq    SEQUENCE     w   CREATE SEQUENCE public.id_wallets_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.id_wallets_seq;
       public       token    false    7            �            1259    16395 	   task_data    TABLE       CREATE TABLE public.task_data (
    id_task_data integer DEFAULT nextval('public.id_task_data_seq'::regclass) NOT NULL,
    from_csv text,
    id_task character varying(50),
    put_date date,
    all_number_times integer,
    count_address integer,
    amount_token numeric
);
    DROP TABLE public.task_data;
       public         token    false    182    7            �            1259    16402    task_history    TABLE       CREATE TABLE public.task_history (
    id_task_history integer DEFAULT nextval('public.id_task_history_seq'::regclass) NOT NULL,
    name_task character varying(40),
    status character varying,
    wallet_id integer,
    start_date date,
    end_date date
);
     DROP TABLE public.task_history;
       public         token    false    183    7            �            1259    16409    transfer_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transfer_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.transfer_history_id_seq;
       public       token    false    7            �            1259    16411    transfer_history    TABLE       CREATE TABLE public.transfer_history (
    id integer DEFAULT nextval('public.transfer_history_id_seq'::regclass) NOT NULL,
    sended_tokens numeric,
    number_time integer,
    task_id character varying(20),
    time_transfer date,
    sended_addresses character varying(2048)
);
 $   DROP TABLE public.transfer_history;
       public         token    false    187    7            �            1259    16386    users    TABLE     P   CREATE TABLE public.users (
    name character varying(20),
    age smallint
);
    DROP TABLE public.users;
       public         postgres    false    7            g           0    0    TABLE users    ACL     �   REVOKE ALL ON TABLE public.users FROM PUBLIC;
REVOKE ALL ON TABLE public.users FROM postgres;
GRANT ALL ON TABLE public.users TO postgres;
GRANT ALL ON TABLE public.users TO token;
            public       postgres    false    181            �            1259    16418    wallets    TABLE     �   CREATE TABLE public.wallets (
    id_wallets integer DEFAULT nextval('public.id_wallets_seq'::regclass) NOT NULL,
    address character varying(20),
    private_key character varying(50),
    id_wordpress integer
);
    DROP TABLE public.wallets;
       public         token    false    184    7            Y          0    16395 	   task_data 
   TABLE DATA                     public       token    false    185   m        Z          0    16402    task_history 
   TABLE DATA                     public       token    false    186   �        \          0    16411    transfer_history 
   TABLE DATA                     public       token    false    188   �        U          0    16386    users 
   TABLE DATA                     public       postgres    false    181   ?!       ]          0    16418    wallets 
   TABLE DATA                     public       token    false    189   �!       h           0    0    id_task_data_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.id_task_data_seq', 23, true);
            public       token    false    182            i           0    0    id_task_history_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.id_task_history_seq', 2, true);
            public       token    false    183            j           0    0    id_wallets_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_wallets_seq', 2, true);
            public       token    false    184            k           0    0    transfer_history_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.transfer_history_id_seq', 2, true);
            public       token    false    187            �           2606    16423    task_data task_data_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.task_data
    ADD CONSTRAINT task_data_pkey PRIMARY KEY (id_task_data);
 B   ALTER TABLE ONLY public.task_data DROP CONSTRAINT task_data_pkey;
       public         token    false    185            �           2606    16425    task_history task_history_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.task_history
    ADD CONSTRAINT task_history_pkey PRIMARY KEY (id_task_history);
 H   ALTER TABLE ONLY public.task_history DROP CONSTRAINT task_history_pkey;
       public         token    false    186            �           2606    16427 &   transfer_history transfer_history_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.transfer_history
    ADD CONSTRAINT transfer_history_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.transfer_history DROP CONSTRAINT transfer_history_pkey;
       public         token    false    188            �           2606    16429    wallets wallets_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id_wallets);
 >   ALTER TABLE ONLY public.wallets DROP CONSTRAINT wallets_pkey;
       public         token    false    189            �           1259    16430    id    INDEX     D   CREATE UNIQUE INDEX id ON public.transfer_history USING btree (id);
    DROP INDEX public.id;
       public         token    false    188            Y   
   x���          Z   
   x���          \   �   x���v
Q���W((M��L�+)J�+NK-���,.�/�T��L�Q(N�KIM�/��N�+�Q�+�M*)��M�Q(I,Ύ)q�a��zSR�R��S�5�}B]�4u�MtL��/���Դ��G�(1V7qq �rb[      U   X   x���v
Q���W((M��L�+-N-*V��K�M�QHLO�Ts�	uV�P/K,�LT�Q06ִ��V���<�N#C:����\\ �Y�P      ]   
   x���         