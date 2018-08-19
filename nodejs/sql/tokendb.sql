PGDMP     ;    *                v            tokendb    9.4.10    10.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16385    tokendb    DATABASE     e   CREATE DATABASE tokendb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE tokendb;
             token    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    11855    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16386    id_task_data_seq    SEQUENCE     r   CREATE SEQUENCE id_task_data_seq
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
       public       token    false    7            �            1259    16392 	   task_data    TABLE     s  CREATE TABLE task_data (
    id_task_data integer DEFAULT nextval('id_task_data_seq'::regclass) NOT NULL,
    from_csv text,
    id_task character varying,
    put_date date,
    count_address integer,
    amount_token numeric,
    active_task boolean,
    number_times numeric,
    real_number_times numeric,
    remain_token numeric,
    pending_transaction boolean
);
    DROP TABLE public.task_data;
       public         token    false    173    7            �            1259    16399    task_history    TABLE     �   CREATE TABLE task_history (
    id_task_history integer DEFAULT nextval('id_task_history_seq'::regclass) NOT NULL,
    id_task character varying,
    status character varying,
    wallet_id integer,
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
       public       token    false    7            �            1259    16408    transfer_history    TABLE     �   CREATE TABLE transfer_history (
    id integer DEFAULT nextval('transfer_history_id_seq'::regclass) NOT NULL,
    sended_tokens numeric,
    number_times numeric,
    id_task character varying,
    time_transfer date,
    th_hash character varying
);
 $   DROP TABLE public.transfer_history;
       public         token    false    178    7            �            1259    16421    wallets    TABLE     �   CREATE TABLE wallets (
    id_wallets integer DEFAULT nextval('id_wallets_seq'::regclass) NOT NULL,
    address character varying(20),
    private_key character varying(50),
    id_wordpress integer
);
    DROP TABLE public.wallets;
       public         token    false    175    7            �          0    16392 	   task_data 
   TABLE DATA               �   COPY task_data (id_task_data, from_csv, id_task, put_date, count_address, amount_token, active_task, number_times, real_number_times, remain_token, pending_transaction) FROM stdin;
    public       token    false    176   �       �          0    16399    task_history 
   TABLE DATA               b   COPY task_history (id_task_history, id_task, status, wallet_id, start_date, end_date) FROM stdin;
    public       token    false    177   �B       �          0    16408    transfer_history 
   TABLE DATA               e   COPY transfer_history (id, sended_tokens, number_times, id_task, time_transfer, th_hash) FROM stdin;
    public       token    false    179   -C       �          0    16421    wallets 
   TABLE DATA               J   COPY wallets (id_wallets, address, private_key, id_wordpress) FROM stdin;
    public       token    false    180   JC       �           0    0    id_task_data_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('id_task_data_seq', 30, true);
            public       token    false    173            �           0    0    id_task_history_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('id_task_history_seq', 3, true);
            public       token    false    174            �           0    0    id_wallets_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('id_wallets_seq', 2, true);
            public       token    false    175            �           0    0    transfer_history_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('transfer_history_id_seq', 866, true);
            public       token    false    178            s           2606    16427    task_data task_data_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY task_data
    ADD CONSTRAINT task_data_pkey PRIMARY KEY (id_task_data);
 B   ALTER TABLE ONLY public.task_data DROP CONSTRAINT task_data_pkey;
       public         token    false    176            u           2606    16429    task_history task_history_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY task_history
    ADD CONSTRAINT task_history_pkey PRIMARY KEY (id_task_history);
 H   ALTER TABLE ONLY public.task_history DROP CONSTRAINT task_history_pkey;
       public         token    false    177            x           2606    16431 &   transfer_history transfer_history_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY transfer_history
    ADD CONSTRAINT transfer_history_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.transfer_history DROP CONSTRAINT transfer_history_pkey;
       public         token    false    179            z           2606    16433    wallets wallets_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id_wallets);
 >   ALTER TABLE ONLY public.wallets DROP CONSTRAINT wallets_pkey;
       public         token    false    180            v           1259    16434    id    INDEX     =   CREATE UNIQUE INDEX id ON transfer_history USING btree (id);
    DROP INDEX public.id;
       public         token    false    179            �      x���I�%�R����qǼ05.��"� 0P;�(�0��;�&G����ʪ㩐��FrEt?���hs��������g%��b^a��=x	��b�)3�~���������C5h�G������/�Z�u��C�+5�}D�W���������D����+\^�e�4v��'E]�i�˞�J}�]�w8�{*]�D�Y�UF^i��|�a�X���v�{\����2(�*���^rqɇ^Jl��$^si��!�~����1&�7bq-�Zr�n�T� ���X\A����W8V�S�=���Ye�=f{(��ff�5&KX��ϩ6�O�񲜪;�ɔ��Y��Z}y��e��1�W��C��\��՘�����n���:���e׃�z������l�#3]-��a���s.��d�I���;V��N��Ci��V���h���f!�����w ��{DE'ɸ���@bӶ�H�X�A5�w+���#2ے���MH֪MW+�u!�5����ڵ��g��;GĘ���c�)Wv�I�sA2���u�V�&�⩲Kc�-;��cW�*��@>��2�5\oy����2k�S뻧˲�'e+s�K�5�W����L�9s{,��q��fj$@(�=S��SB�^�X|	1S�Lv2�\S%3TS�D��Iz
�X(�_���U�r������f�gm1�Iҥ�#�~/̚K.�7�@m֬�\s��t���0<V��#�q���<)�(Zc�xRǃy�@��dW�4�.j�>�6��]ԿG���53���;$�8E[�{w��Iz/�X����V?�P���sv:v)k����#S��$��kcL-u�ٜ�h����$��������VLqx�}�[~���p���ni-í6����'Zޏ�\`�)t`y̹v�E<��W8O*�u|�W���!�^�����#��$�/W��q��:��{���W8p�Ƨ�دh` �.�}�2��撘��ؽk$�+�>��&�1[ig� Xt�nf,._�� e�ُ��'A� ��I��:R�F�&o�8�Մ��5���|�Py�����&c�su,�(��N+��J�:4
�!�Ȃ��	䲤������Ive�{ ��!��"l���37Uz0�(!�,�^:�N�p��G�&��ïMS\s�4�ZLWH�E*4�&�T�7V�'O�orkƴ��b�:�'���0�@�����	>g�F�m��YI�����(=�B�R�Zg��|yR�ɻ�V�*BѮ:��%֟!�RE���y��ɱ�w8H�q���;�<i�8��z,�cs	��w��ch�,�PT�t��
��hs>�4H��p�@ˏ��/8�n�){E��S��$U'��f>���}B��=� D�V��N����iod�j��㱾�e��9\������J�6e[(�ԥ�!^�fT���ǅr)�ي�W�Ƞ/Z���m4<�ak�s
H��pR��;�H.���qD.B�����$-֞�K]D(�;K�@�4U�.�$ԯ�bI!蜄�mǷ���i`.����ŀ�3"��c_1�8DH�$D����M��벉W��<O�I���O'yH�F������z��ܕ4Y�;���rHʮ�9�7���~ hO��u�-yVΣ��7v�^�,&t�~�;\,�>�l�\7�ɾ/(0k�Q�e�K�m�T\[�p�q���/s��Ϩ���������`�a��<b`8	��S��g3>�+��?j�����V@{�7yR/�u�0{���������IF8���}	{�#��o�	�b_����h���,�J٠��E/g���y�k�L�����@́���Gi�M��6��T��[�5/��|��֢�xZ�#B�d'�:3���΃H�^4~Cg0¹p��˔R:D�	�A�1������5nV�I�(�T�2� ��@�"p@Y>s=G��ǞLy���a`{B~P���y���)��#E��F$�G
�TFLA�V�0��zZ�!���$��0.�:�%A^	��ꒉ�n*�J��t�����`�Kyyu���N1k�Tɏ �ˑc����{�r�X��`��17�e�M��=��#&��}��о������B�m���H �>�9�Q��8�eog8|HFr��\BjO���h,�ǌfT�Xh����;~+<)�ToQb0�*������Y@��0Y{c%\q���n���n� ޹��V����G�&lv���S�����j%��jK�8��A�"����%�6.������(�[ϑ�_��&TS��e��>�C��Lx^�K���$"���um�{�
�C�/�+�p �s5?!�eoz��� ����GvOS��D�e|�iP�g4��z1]|� ��R�DTo����p��������.[���7�#Q��,J�DL^[�xN�]R���bׯ	B��I��v����
Vn\qD�!�c)���F�,����=+��#��&cc�H��t��º��_�t���A�����C_
b��Ж�N�1g꓁��m��&�C>�h��4Diu��|��!�à�eGp�%t��Q�鄘��;SX����%(5�	�Aa�R�Ɲ9�Ev�
�w��ޒ�l��}���L��u+mbt!�F�f� %C�9F����Ic�GP�-ϰ/�lR0�!��^%c'����u�8�v��2��'��(DѮ>�Ƙ_m������w8
�!Z�lKa�Е�2Sȇ� O�jM��MS��I�o�-������eۻ��X�1N�V4ea��y�:��[��倴��E�G��o/�|ۣ[H~�br!f��ċG����B�\x�l²�?*�CibOW��{�M}u�D2�xS_h�Ȓ���5���� CیkC��w�A�"e�ޒ��'�K$,�Ϙ���늑p�M�bR��*���{t,���$��Ӄ�wȬ���f�F����و�$Rx�nܵk�hRؗ�I'ީL�T�8�U�w�6�Ep����P ߷�
�f��j��#�Fn�6t�w۶�}���P�s2Fp cT�>6���� ����*�R��-��Z����D0��#��ir�[��t�Q��d7��&h�B���`�\å?�L�iح�w����m�f��]]���1'��'ُ���J2�9�;&+8���`
'�Rb���p��a��1U�>�n0�	?/�w��1�E݅�;�ѧ]��j�������gS��$�p���5�7�Uj �����yX	E�i��w��¢���pR���]l�8Q�X*R_mt��O1�ȝ�`����e# ۊ*�2��CG0��Kؔ��]�:��=rI�j'O(��g�u���bb)ĎM L=�r ������` ��2���-�8�:������j�B �.�Ԧ�^j)�����P�m"��e�}ǚxAb�����#�Y:�%�	տ�d��[�&�o�EP��r٘J�m����bU�my�a�gG�!�WCtO�W�V����� R��ss�q�t �eH$�q<��sw=�cW�R#��I��l� ��a������ߓ��5�.��"�q���n��%$roc�5�������G3*9(H?QR%�-��pEE/�k��6xt�/oMC��^�6l�k��I��r�	���Z����������ֱ����k��n/��xT։bp����1��1)pk�@��.����=j2�����/+:G�FD�DTV6�=�VN��,	3����B������r�^d%h2	'�cɜ�ǎ�鹗��O�l4&���Q;.�y���v�U�3m�o�Q���*d�ވ�BB��ƀ�QKV�� '��TG%!ƾML*�9*�˾;Z���݄
�t�mx��5��Q��I�h�� �Ǩ�򬡤��~\�����4 �@�5KǊ��S����:`��U�V;K��ztuک�_&�bi��<���rDےO獵� ۔B����M7�x�CKRǏ}g�dT�.5��e�W�t��,a���~�������Jn`ߐ�эf��ŕ��x�ۊ�i�Ш$�%�o�:i�F����y�z���͓/�c�]���.2+�    � �~�`;�7�S�R�r~:�!@`N���F�aM�1 �ɶ|��o8#af�"��{�o�aǀoO�α�v����S��G�QA�]�!�h#{�L �;:�&�Ş���>�Ǆ?6���nσD�vz�N�J6<��m=2�N-��3�c�z�t�MY�a�?�&�^���(=�P�u�3�َ$咾$"��
�mߺS�.�;�x������<��{)0hȫ�90O�@1��,$q����ͧp,H8�N��6ʂIg�ZvP��ML�u3���e�3ܛ�l���''�mcv�_��	+���A΂�y0M^/�xV�(�GI�_�߽�n[Z@J�U��ǣɗ'�����u��yvn��^P�ɇ�*w�*u�7�v�S\0�z�(p���dR�qj MH������+�zArē�/wd���YJʍ�:L1�ݙ�;�Q-��rkŰO�l��wX5Q�i�S���HX�p��7��A�L<8�m�,�$ZZ�kDbE��#N�G5�$4�����ӌ�M��ZN����<�'�I}$/I����D�/kT I2�o⨧��<b��o�W5����"�)�*|o��#��
OR�0�^�߭�ڱR=�	CF��k"���g0������cJ�z%��b��Y)O�l���c��ޛG@>b�à�O������{���S�g#�mYGŻ����J�_?y��d��{���Z�=	E�K���m0h�=A^o��eh]m���c�%���I����c�X_�-&xNSlTjL����n*�����F![C�utwX��֋�޵U��*W�`��5��K����U��k�B��"ɶVC	��<�.M�e��^1�h���T+���A;�=8k�,�A�� \u�Y�`��{�)dG
~��֮����:�ŧ��K
�9�X벝��#d��)�P|Bӏ㤎0�`>�M/ɰ�b��E;�̗�q9Ov���p�B0أx,&��	��n�H�"�m�c�xNZ��k�V�*����[����v$�چ���I���K�8E��,	[ɉ>��_Н������x�E��Xn�M^�d2➀P�V��57:A�I�/�����MR"�/��Z����<B9����,�D5�,��G8p(�q}��P,8`Y�~��P[5v��h3ݑ��'{�/��"	5El��L4�G��I:��p�-�{)`_D*��c��G�Y1@�����3\��j���Y�[S�T��/�`�m���grt�ۙ�S���?���v�^�sݬ���(j�~�Ʋ�[��5��0`��X���7,�lU�����p�GQ؎:�dB��ڷ�\�Op�!��w���ʶ~5����dO�CV�"�ax&r�2iհ�޶���Zw��e�n:��l�>��'��A%��� w�T(gF�\�6f�e�*�П� ����2�I	�C�a¡�Q����'>��=��Kk+g}��D�@�)�'��Q���`�\�^�s���Eݴ��l�e3���6`�N����@]�1����b@���11�j�WYxA7�����!�3�w��mS*�Qw��-�B�+�3B4��|D��u�����S.�Y�in�ϊ�6M�<늮�4!s�7��R�cm�H�\#�ѣ�҂�%��H�	�U��ryn��n�y�ɬ��v2A)@�3�W�����+<U�<��5�,f���~i�X#oN�~�u��ߏW��E�9DČ���,$kof��^��k�b�q;�kֱ>m~���n�+iƉl
$��{X��� D��q�Y��5�7?S�aY�(q}z�:v���$')��Ձ_5�����1"v�e�*?(��1[����ҥ��E�o�n�@�qW)�I&�<���ι����ف��I�����'�1 R���]���<	��V�ȁB�����o��{K�;�f:�G_,�@��4�����O��Z�/k�ʐ?�4/}i�l�Å.d
���g�`��7��Z�Ѽ�__r�-�T���Z-�^��)��h���X���t�6�`>D�r5CO}X�|���#�"�8��M�#.>jXd��)�wTb������=Q�x߷��aWF�)�VCH���q}G�@�2�C;�3/�1�C7a���CkS�qֿ�,�;�-�S��m`��5�R3�g�n���g�,
��k8u����v����a���6�KS>?%.�*Z�Q;�A}v��-�5Y�lC�i!˂S�I�]{F0�������.-ChI�.��#���azk�6�A��!DK�^���¢}�S���)�D��$ML�D�3��q�Q��O����SD�s謦�v�D�&���=��>4�,��v9f��0�Rj�,�TT���V�?����0VѶk�H.kk��K��\��Y��اh\��E$���`XT��3�%��hn:&+X�VU&KA�0FxE|?�	��;����
���/�-@;ZfV�v:>0�+����>;�	��(�G?���}.��5�j�j:�#9<Q�u���_���s1uҟ�J�k�������F�r��3`�!O��"S R�W�5H�󊵅�����3a��X�X;$l�}I%6,Hvzl�\�xk�O��&QA!Sh�3���/[����l]:���N�H��]kr����v�����	,�0S��5��)K�	+ٵ+����z�S��|u-�;
$W\?���5�E�������b�u�E�M��ܧA��=ɩ%ڬ������1k��V.�z��s������8L�-��x�mt�R�U�n ܩA�җ�o�ﱛ�\���aGv�!�����TĔ���֗3�1�֛=+�o2-7�*UݻK�����à�ѹG�Z�Dm��.M�+�o׋���=�
x�֭&�m��m|��<�o���:���e��[K��@�n���w��8�.����e�BZf��[��G\3�9������{D4�D!Z�B��ѭ+��d��9_sL,\�L��I0.v�g��/�j��ݎ8�YV�&"��k��v+'5���va��]\�\
9fIk|���`m�q�Fˠ`�lop}^z��(@�D��J��r��Xl17�ݘBg9{QD���[_u?Z(��8k���kر6ej�B�l���������<Nq�/�u�AOQ =��!ɰ��ayF��4�'��1@Y����o	37ۢ�َT�Q`>Gw9H���(?�ϐ�6�2��v4�陰j������-7 
M�w� �K\q�������%���P�=�]I���mR/mLl�Rw�ˎ�-���d� 
 ll2e�dkf�����1�͏vnd�?�ET���`n4m��p
��m�'6.�O�k$Wr=�:WK���vVӥ�)��Z����������pD�V����V���~� ���a����m_|�MV�I[:Ca~;g�R�p�>�j���S7+N�|ŧC�	�V�M��:I�J�W��|�̻�(�,Fw�����{�h&*��v��,2b�H�[�!v�9xͫ�3��(eX����u��/��]<��Y��j�\s.�YM�ۆ� �3
�@��x��u�@���\ƻ�ֆ�6�m�.%:C.v#����_/v�'�}��d������.���L�#a���`�]>֕�C��ίj2u���4�o�}_���ms��=wr��y�)�ף{ʘ:%` ϋ�U��?��s��Z�+�x&L������5ߡ�u��t����ċ��m�Ӌ0J��R-ڋ����ٚ�F�=�����y��*��;���c�*��=�׋������T�J�θ�m"���b���B���v�{�q��6�(�;�(6����␃uۦV�c�a��9-��q�iG4G��81�H�V����耞(d� i-E����������֥����9/
.'�(H'DA�u0�ٰK��e݋�쯝������EE;$�絸[_BM|'-v���+Ei' �o��z�5��|����11��s`��C���S�b�0�LJ0�]氛Wj�{|%��(��f�m��PH�^h�Y�� T  �.J�b�bBB��+ĹHf��h�l�c�����EK�fo��G�����
�&�ibއ�����ϑg���W�n��[���h�7V�l���#��{3�G>���{��V��]`�xдIɶ��G�%Oɶ5^~B�L���k[�;{�Wp�]v�H=0M�u�c1�q�%Ux�v��`{� <�?k��J�+�`�;����O����2�duf-��s�)�k>�r��"�{�� �(��0�%����
�*���pB�`ɾK/;}�t��;/��� ?���v)��ya)��p�v��y���N�.��p�Y�=��Y��$<�l�����JG�=:��˚����� ����mT{�ۢ��U��f�$C�\��הj�^n5\(�U��&;>�P'���]�)���r�v�d�\�=i�Q�¤x�s4����w^��F�l��|0�����g�����U��>Sb�h����)�7Z`���e� ���"�� �mO��-���&��E��P�˶k��^�l`�#��·����ԣZ�*bW�*�c/�qf�Q{�����i�{�S.��D���� �2����"��L*=L�r��nT��2=�^Db��n"�0r����'��2::z�\�U�rb�aAE��Q3��]�8�-�xi+ ���C�#E�J�%Ƕ�>��a-���Y�r\��(��{���iﯴ�V���3���R�;��Ǉ�j��0�fau��'��<ud��b��#��Ȃ۹u%d�� 's���n��I6F�2���>]�CAx�F�c��[eO�O���;T��q�D��x��ZT�=�n�m$��6k��y��zk���_8��1-��>�C�[����IP����1���v��R��7��m`��s!W&��ۍ� ����Zx��/G�7?��� @���fc1V{�$pt2�So���ˮ��%���y�KpBv�����5��+��C.o�={c���M�^�5���H�Y�c/vq�N��?~���_~����Ͽ�����s�?��⯮�՗���f}Ukk�m&~r��o?�������?=��_����      �   -   x�3�,N.N�.��I.��-.N+NI+�,*��4��"�=... ��      �      x������ � �      �      x������ � �     