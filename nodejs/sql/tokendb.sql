PGDMP     '                     v            tokendb    9.4.10    10.0 "    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16385    tokendb    DATABASE     e   CREATE DATABASE tokendb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE tokendb;
             token    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7                        0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    11855    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16459    id_new_wallet_seq    SEQUENCE     s   CREATE SEQUENCE id_new_wallet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.id_new_wallet_seq;
       public       token    false    7            �            1259    16386    id_task_data_seq    SEQUENCE     r   CREATE SEQUENCE id_task_data_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_task_data_seq;
       public       token    false    7            �            1259    16388    id_task_history_seq    SEQUENCE     u   CREATE SEQUENCE id_task_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.id_task_history_seq;
       public       token    false    7            �            1259    16390    id_wallets_seq    SEQUENCE     p   CREATE SEQUENCE id_wallets_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.id_wallets_seq;
       public       token    false    7            �            1259    16461 
   new_wallet    TABLE     �   CREATE TABLE new_wallet (
    id_new_wallet integer DEFAULT nextval('id_new_wallet_seq'::regclass) NOT NULL,
    address_wallet character varying(42),
    private_key character varying(64)
);
    DROP TABLE public.new_wallet;
       public         token    false    181    7                       0    0 
   new_wallet    ACL        REVOKE ALL ON TABLE new_wallet FROM PUBLIC;
REVOKE ALL ON TABLE new_wallet FROM token;
GRANT ALL ON TABLE new_wallet TO token;
            public       token    false    182            �            1259    16392 	   task_data    TABLE     �  CREATE TABLE task_data (
    id_task_data integer DEFAULT nextval('id_task_data_seq'::regclass) NOT NULL,
    from_csv text,
    id_task character varying,
    put_date date,
    count_address integer,
    amount_token numeric,
    active_task boolean,
    number_times numeric,
    real_number_times numeric,
    remain_number numeric,
    current_tx_hash character varying,
    id_wordpress integer
);
    DROP TABLE public.task_data;
       public         token    false    173    7            �            1259    16399    task_history    TABLE     �   CREATE TABLE task_history (
    id_task_history integer DEFAULT nextval('id_task_history_seq'::regclass) NOT NULL,
    id_task character varying,
    status character varying,
    id_wordpress integer,
    start_date date,
    end_date date
);
     DROP TABLE public.task_history;
       public         token    false    174    7            �            1259    16406    transfer_history_id_seq    SEQUENCE     y   CREATE SEQUENCE transfer_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.transfer_history_id_seq;
       public       token    false    7            �            1259    16408    transfer_history    TABLE       CREATE TABLE transfer_history (
    id integer DEFAULT nextval('transfer_history_id_seq'::regclass) NOT NULL,
    number_times numeric,
    id_task character varying,
    time_transfer date,
    th_hash character varying,
    sended_tokens text,
    id_wordpress integer
);
 $   DROP TABLE public.transfer_history;
       public         token    false    178    7            �            1259    16421    wallet    TABLE     �   CREATE TABLE wallet (
    id_wallet integer DEFAULT nextval('id_wallets_seq'::regclass) NOT NULL,
    id_wordpress integer,
    address_wallet character varying(42),
    private_key character varying(64)
);
    DROP TABLE public.wallet;
       public         token    false    175    7            �          0    16461 
   new_wallet 
   TABLE DATA                     public       token    false    182   �!       �          0    16392 	   task_data 
   TABLE DATA                     public       token    false    176   �"       �          0    16399    task_history 
   TABLE DATA                     public       token    false    177   z1       �          0    16408    transfer_history 
   TABLE DATA                     public       token    false    179   &2       �          0    16421    wallet 
   TABLE DATA                     public       token    false    180   �6                  0    0    id_new_wallet_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('id_new_wallet_seq', 8, true);
            public       token    false    181                       0    0    id_task_data_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('id_task_data_seq', 96, true);
            public       token    false    173                       0    0    id_task_history_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('id_task_history_seq', 23, true);
            public       token    false    174                       0    0    id_wallets_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('id_wallets_seq', 6, true);
            public       token    false    175                       0    0    transfer_history_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('transfer_history_id_seq', 941, true);
            public       token    false    178            {           2606    16427    task_data task_data_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY task_data
    ADD CONSTRAINT task_data_pkey PRIMARY KEY (id_task_data);
 B   ALTER TABLE ONLY public.task_data DROP CONSTRAINT task_data_pkey;
       public         token    false    176            }           2606    16429    task_history task_history_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY task_history
    ADD CONSTRAINT task_history_pkey PRIMARY KEY (id_task_history);
 H   ALTER TABLE ONLY public.task_history DROP CONSTRAINT task_history_pkey;
       public         token    false    177            �           2606    16431 &   transfer_history transfer_history_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY transfer_history
    ADD CONSTRAINT transfer_history_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.transfer_history DROP CONSTRAINT transfer_history_pkey;
       public         token    false    179            �           2606    16449    wallet wallets_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY wallet
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id_wallet);
 =   ALTER TABLE ONLY public.wallet DROP CONSTRAINT wallets_pkey;
       public         token    false    180            ~           1259    16434    id    INDEX     =   CREATE UNIQUE INDEX id ON transfer_history USING btree (id);
    DROP INDEX public.id;
       public         token    false    179            �   �   x�Eʽ
�0 �O��:$��^pJ�R�V��	������:���7�zZb�Kq������EqH㟥�)]�v��r=<��#�'b�k�E������UR�h�11�1[--(��T+�lU��Mm���JbpD�l5�'T��1�B��ԸZ; �}����j�|2˲�z*6�      �   �  x���I�&���������A2$�>4�����`�d�"������T&0���UU|�]���O���_������S���w�~�/��n����ח������ǟ^_~~����?�O�ח���>��c|�?����_^��o�^�O��4��>�o�ûO߽�|�Y��˷���~��M*��a�Z�|����_~�?~�0��ү_��w����z�U�ח�������7�y#��=ǖjH�Ou�y�����;y$o���Cx�������7o�K�Ϳ^Q��QF��7c��z0�]������{7�\.�r9&�[�45隱���d�l�]\*��+�޺_9��9�V(7��Fc�i�UBu~��B��rK�y])���aQ2��#��S��|�9�PWTg)ט{�Pεx;!����z��RS,9�!���:�$б0�Z���S9��Q����:f^i����F��H��xO��c;��v���q���w�8]H�z�Xcoәg�sϵ��N�"��G~(g���/U��֪�I����{�$�K�K1g���Z3�����|�1�L"⋧I�)Sϵ��;0�򹦚�uw�m������ s�)��ֹ����(� ��&O��5T���z�6���j��Br_Q�Q�����U��6k��ě�\)��UJn��C�&q��404�WQ�X�WsVO��!v�$�і��2�.U�B
?��1�e�VS�#Q�&�~��V�%�Ad�t���K�V(@&)�2b��� C�y�X��v�z�zd��� f�}H�5�.]��B, �,��a4_�e��S��x�����O��ʄ��~�/�Ŵ_qi�S�&Qb�Sa����ZO%bc�8��q:`�t?��\��^��V��N��9���]�"Ֆ���P�^�ya�����w�$V��5py�T�g(B-c�,�Չ��!����5/s]8���+c��X_9Ϲ�,�.�h�Q��;�z��*��S�hr���g$�
�X��8�{���>L�[)��֥�&�J#[�2k?
����۬�Yu�Z�c̕GV����Bq��~'��YN�-�]$��\f
+fi�7�t �r�Z	Gطjp�N���m�<:�)cjH� vkgO�%��s�w飖W��E�eѱ0]�`�������z=<�/�-XlX�ķn�8�l��7f�*,|.]tH� s+��"�A(�\b�Y�9.�6��	!OO�����<5�%��4�B�����p��~˱l����T�t'd�X� �N�Rιr�>3s�k���1�8'����X��d@Ky��ҳ<="�x�@>պ�v�?����	ep8��i��"ޥ�f��(C��8id���6W�������Vr����ONj���*C;�o�;��?Kj�(��.�sb�H�Ƚ�Y�
2�VC`�'����F�����$��|�[�<���v���/C��6q��PN�\F��%=��s���hh��S�s��R5p5�\�r�����<�ja���qa��Z d�j�_�֩\����fk��A��HJk5�[���M�m�+gEu1����H�����z�}�
5����8�e���0I��ӂ�?��`�c�\	3cr1�n\��F&���(�Z&��Y+C S�a�v�%�~�9zocP��g�S�9<$�"?� ��hafT�C�!u��D6Gw����Ajh%ץmn�@vQ�w �EmC4u��]�Δ�vwo#�]����� W�`)��*o��K���G�@�ou�6xfJ���q�OF�:��>{.��Á�{��&���D�Ee�*�'�?M�"K���R.�1l���$���������K�	�%jd�K-��qf��[O�2�7��V�ʮR!�ˑf;uz?����0�&�����Oơ'C��_s] ���O���u��N �sn��`�Q��^����q��:����3�Z��5�_�n��8o�ϼ���+j7'3�n9��,�N2u�����Z��H�<x���`�c�:Kӡ97�� �d�Ʊ�۵c�j<E�p�1�����k���&8�}�r]]$;�r��$��aP{B�3��R��=a}��vɐ�"���h��w���BZ�@ �&�iz�k���d�x�.$��xEl �i��)�����d]2V��>����b@���0�,����رp-����{�R[D�Q��7����e�Z�~B~�R. �;�=�-�^�LZuc�� r8�H��e��r䐄�����Qa���#젊Q'� �����?b��d�8���4%����0�k%*Zq-ǐ=ɪ�m�H��N�G�󀩨_�(s�f�;;�9f�=�����`�V�D�	~Av0�X��}��N��p���r8i��@�g��@j2��v��#���aZ�-@�8�K�j���*���:�d���B)����&��Az�Z��Qw���� (���.vF�Z�m�<��
�tF�p#���ͥ�0.D�`_x�TZ"�u�.r9\ѭΡD`�謆E�4��%�,������CR���y�	�p�
\�H��9<�2�������x�����+�D ߲�a,B 9íD�A��\����f�xM�<�e0�Z�u:�4\z��	��w
�a_!e�ZQ?�����	!#͆1�3t7�,�?���������41�}�{%� V�~>�\�]�Y�*Vf\v⚠[
��p�ki��Z.W���w4��[����87r���12 NX�lK�M��GH�Έ/�����]I�h"N武#9(T�<�wp���p��f(L�*.�ʚ<����fm'�s9�Zz��"J�+K�S؇�!��X�#w�͢G��v3�|Л'����ʮGΠ��(O�Y&l�i��ξ��z���Y�������&���;P�Ňđ �p�{�y��`�3�L�Xf�ǅ#~8M���;��җq�X��w��m��%����1r	b�/�j�MN�7Ŀ ���r�S{Gd�HDr�׈w��k�XB�K9�Eg~�W�q����d��`�B�������H��m��}u#���b����#'�]�1��a|p�V�x��#�/�h���ܚǁ8r��*����jy`/հ4�t�QJ�'8Y���GN����5�����墋���9�W�b�x�xi��/z��>�6.��h�����I�%��`��%<Am�f@dz}
�wjx����Oj�W���&F���kzFX�\�b&�N��Nq�\Q�g����	Y^`��C�8�R.F�z/��l0���l�y�ǰ��5��C:��� �M��a]\�J���O��*,��{��G5w)�oޝ�t����մ�lCZ]t����y.�y���CL�'�H%>�Y{C��c� 7z��/���2\�����1��Q�D�j��V�̩�r���~���i�U����,�Ј	`a��s)Q�(�x�������ܾٲB�+C���}3wޡ�=�聐�ط������ɡ�m*��o�(ڸ<�$�(�Í��#�M�h�:Q��A��[�&�hř}1�ۄ8}�����}��I��}_yԾ��
�C�x^�A��C[nS�cU�Ȱn"c�q����~��.�g8�w���cם���k�I�H�a��(j�� |Y�c��M��n��a���ϟx]=��$vo.g��	LG��_��|=S�%������������-h�\��yq����b���^_�1��חU��8y����7���7��ѯ��W_�/�;�,      �   �   x�U�A�0���>�{��Nm9:u� �Bήck�$��ѷO�C��Ϗ�i��$�ieQ���N!���d�/��u|�^���BX�Geut�ݮ��y��� ���h�ю��0Zڢ��"F��c!gF��'�c�r�|Yy�*�	�q���B�4"8A      �   �  x�5UM�dG�ϯ��m�)?�{ڃㅵw��R)1���c/���#{٢��^�SJ�x���������?�����?�V���������<��x��~�e�ޗ�������y��_~z��������O���t��?�����r~}���o����������6��AO��rm����c��8]�-���E��	o�
�F��d�$����Ŗ��d��go1�[�&�%ϩ�=��|���*c��ԼU�K4<����-�n<���{G�j�8-z����ZG5G��Ҕ��ok�S]9֨�Q{5R*�x֠��h��t�[D�����r�u�vZ�n��[�����޺�&��ڽ{���ԧF�n�����t�CSw G��lC<�����ZG�B0���Ӭ5�90�m �,ܝ3�/��c���,'��P��U�ѿ�\q��M�ψ0Z�-4u��Х7p��YDԬ��EtZ�[����~�ڗ^�}���hKy����ɉ	ź��äk,��t�k�x��#�D0qI�F{@+i����ef��q1��˅f�ͣCP��3�%+X��hh���E3ήQ�����+�Y@�A5}׆�5�bP�0��a�����D`�<��{��<�ATSy󀲶���b1�NJ��D欀���m�N��$�Թ"O�]xot@�\Ձx���X�sǲ�G'9�f�żPǢ� �}�t�aL��He �u����\a��
sc�j tl<�۩P�U#��ӵ��0��fY�$J5�2M������t	�^4�-��+(m����%:Bɵ�J�ToJ`���ǅ:5�4��~�9Yzt0��+#^`2<(��@��q璆���5�6�I�� ~ ���Fp{�`E�2=�����
�}�H�ŬE����Z��v�au�ű�60v���M֩� 0/o��t�P�X�[�k��J-#L+p��##L�%�fBhk �dc����]�R����k�b<� *�)Hc�o� ۥ�#L�����yb�33�d���@49Ӂ5���r��p�6�#�Ċ1Ҫ$���da�//��b��򝵑��^�Z�[d0�{6�1`��m#}ii����r{�ڻ����
v$߬�O���3�-]`��]�5�s�Ʋ���\�[N����2K��{߆$9nd����8�	*��˫}�w����*�      �   �   x�=ʽ
�0@�Oq���!��i�S�ހ 
���h"J�^Ep���Ū�M�U����x�l��|y��e��k>�/��2w��)�rؙ�Z�d���=�V~�ZE�B)��i��C�Y���*��ԔN���3�Q�jG5nIqGNJBe\e�L�JDim��(�F�i>O���N9f     